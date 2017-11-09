require 'rails_helper'

RSpec.describe "book_reviews/show", type: :view do
  before(:each) do
    @book_review = assign(:book_review, BookReview.create!(
      :book_id => 2,
      :rating => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
