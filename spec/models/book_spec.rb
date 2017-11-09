require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { described_class.new(title: 'Foo Bar', author: author, publisher: publisher) }

  let(:author) { Author.new(first_name: 'Foo', last_name: 'Bar') }
  let(:publisher) { Publisher.new(name: 'Foo.Bar') }

  describe '#average_rating' do
    it 'returns average to one decimal place if rating exist' do
      allow(subject).to receive_message_chain('book_reviews.pluck') { [3, 3, 5] }

      expect(subject.average_rating).to eq 3.7
    end

    it 'returns nil if no ratings exist' do
      allow(subject).to receive_message_chain('book_reviews.pluck') { [] }

      expect(subject.average_rating).to be_nil
    end
  end

  describe '#author_name' do
    it 'returns "last, first" if author exists' do
      expect(subject.author_name).to eq 'Bar, Foo'
    end

    it 'return nil if no author is listed' do
      allow(subject).to receive(:author) { nil }

      expect(subject.author_name).to be_nil
    end
  end

  describe '.search' do
    let(:arel) { double }

    before do
      allow(arel).to receive(:or) { arel }
      allow(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      allow(described_class).to receive(:title_search) { arel }
      allow(described_class).to receive(:author_search) { arel }
      allow(described_class).to receive(:publisher_search) { arel }
    end

    context 'no opions' do
      it 'searches by title' do
        expect(described_class).to receive(:title_search) { arel }
      end

      it 'searches by author' do
        expect(described_class).to receive(:author_search) { arel }
      end

      it 'searches by publisher' do
        expect(described_class).to receive(:publisher_search) { arel }
      end

      it 'makes sure only unique values are sorted in reverse order' do
        expect(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      end

      after { described_class.search('foo') }
    end

    context 'with title_only option' do
      it 'does not search by author' do
        expect(described_class).to_not receive(:author_search) { arel }

        described_class.search('foo', title_only: true)
      end

      it 'does not search by title' do
        expect(described_class).to_not receive(:publisher_search) { arel }
      end

      it 'makes sure only unique values are sorted in reverse order' do
        expect(arel).to receive_message_chain('all.uniq.sort_by.reverse') { arel }
      end

      after { described_class.search('foo', title_only: true) }
    end

    context 'with book_format_physical option' do
      [true, false].each do |value|
        it 'filters by book format physical type' do
          expect(arel).to receive(:physical?).with(value) { arel }
          described_class.search('foo', book_format_physical: value)
        end
      end
    end

    context 'with book_format_type_id option' do
      [5, 6, 3].each do |value|
        it 'filters by book format type id' do
          expect(arel).to receive(:with_format_id).with(value) { arel }
          described_class.search('foo', book_format_type_id: value)
        end
      end
    end
  end
end
