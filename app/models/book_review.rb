class BookReview < ApplicationRecord
  validates_numericality_of :rating, allow_nil: false
end
