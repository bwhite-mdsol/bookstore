require 'rails_helper'

RSpec.describe "book_reviews/new", type: :view do
  before(:each) do
    assign(:book_review, BookReview.new(
      :book_id => 1,
      :rating => 1
    ))
  end

  it "renders new book_review form" do
    render

    assert_select "form[action=?][method=?]", book_reviews_path, "post" do

      assert_select "input[name=?]", "book_review[book_id]"

      assert_select "input[name=?]", "book_review[rating]"
    end
  end
end
