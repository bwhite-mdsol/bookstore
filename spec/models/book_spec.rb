require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { described_class.new(title: 'Foo Bar', author: author, publisher: publisher) }

  let(:author) { Author.new(first_name: 'Foo', last_name: 'Bar') }
  let(:publisher) { Publisher.new(name: 'Foo.Bar') }

  describe '#average_rating' do
    it 'returns average to one decimal place if ratings exist' do
      allow(subject).to receive_message_chain('book_reviews.pluck') { [3, 3, 5] }

      expect(subject.average_rating).to eq 3.7
    end

    it 'returns nil if no ratings exist' do
      allow(subject).to receive_message_chain('book_reviews.pluck') { [] }

      expect(subject.average_rating).to be_nil
    end
  end

  describe '#author_name' do
    it 'returns "last, first"' do
      expect(subject.author_name).to eq 'Bar, Foo'
    end
  end

  describe '.search' do
    let(:arel) { double }

    before do
      allow(arel).to receive(:or) { arel }
      allow(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      allow(described_class).to receive(:with_case_insensitive_partial_title) { arel }
      allow(described_class).to receive(:with_case_insensitive_author_last_name) { arel }
      allow(described_class).to receive(:with_case_insensitive_publisher_name) { arel }
    end

    context 'no opions' do
      it 'searches by title' do
        expect(described_class).to receive(:with_case_insensitive_partial_title) { arel }
      end

      it 'searches by author' do
        expect(described_class).to receive(:with_case_insensitive_author_last_name) { arel }
      end

      it 'searches by publisher' do
        expect(described_class).to receive(:with_case_insensitive_publisher_name) { arel }
      end

      it 'makes sure only unique values are sorted in reverse order' do
        expect(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      end

      after { expect(described_class.search('foo')).to eq arel }
    end

    context 'with title_only option' do
      it 'does not search by author' do
        expect(described_class).to_not receive(:with_case_insensitive_author_last_name) { arel }
      end

      it 'does not search by title' do
        expect(described_class).to_not receive(:with_case_insensitive_publisher_name) { arel }
      end

      it 'makes sure only unique values are sorted in reverse order' do
        expect(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      end

      after { expect(described_class.search('foo', title_only: true)).to eq arel }
    end

    context 'with book_format_physical option' do
      [true, false].each do |value|
        it 'filters by book format physical type' do
          expect(arel).to receive(:physical?).with(value) { arel }
          expect(described_class.search('foo', book_format_physical: value)).to eq arel
        end
      end
    end

    context 'with book_format_type_id option' do
      [5, 6, 3].each do |value|
        it 'filters by book format type id' do
          expect(arel).to receive(:with_format_id).with(value) { arel }
          expect(described_class.search('foo', book_format_type_id: value)).to eq arel
        end
      end
    end
  end
end
