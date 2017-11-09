class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_many :book_reviews
  has_many :book_formats
  has_many :book_format_types, through: :book_formats

  scope :with_format_id, -> (fmt_id) { joins(:book_format_types).where('book_format_types.id = ?', fmt_id) }
  scope :physical?, -> (tf) { joins(:book_format_types).where('book_format_types.physical = ?', tf) }

  # return mean rating to one decimal place, nil if no ratings
  def average_rating
    ratings = book_reviews.pluck(:rating)
    ratings.size.zero? ? nil : (ratings.sum / ratings.size.to_f).round(1)
  end

  # return author name "last, first", nil if no author
  def author_name
    return unless author.present?

    "#{author.last_name}, #{author.first_name}"
  end

  # search query
  def self.search(query, options = { title_only: false, book_format_type_id: nil, book_format_physical: nil })
    # title query
    scope = title_search(query)

    unless options[:title_only]
      # author query
      scope = scope.or(author_search(query))

      # publisher query
      scope = scope.or(publisher_search(query))
    end

    # format filter
    scope = scope.with_format_id(options[:book_format_type_id]) unless options[:book_format_type_id].nil?

    # physical filter
    scope = scope.physical?(options[:book_format_physical]) unless options[:book_format_physical].nil?

    # compact, sort and order
    scope.all.uniq.sort_by(&:average_rating).reverse
  end

private

  # title search
  def self.title_search(query)
    Book.where("title LIKE ?", "%#{query}%")
  end

  # author search
  def self.author_search(query)
    Book.where("author_id IN (?)", Author.where("last_name LIKE ?", query.downcase).pluck(:id))
  end

  # publisher search
  def self.publisher_search(query)
    Book.where("publisher_id in (?)", Publisher.where("name LIKE ?", query.downcase).pluck(:id))
  end
end
