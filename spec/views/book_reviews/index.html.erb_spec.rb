require 'rails_helper'

RSpec.describe "book_reviews/index", type: :view do
  before(:each) do
    assign(:book_reviews, [
      BookReview.create!(
        :book_id => 2,
        :rating => 3
      ),
      BookReview.create!(
        :book_id => 2,
        :rating => 3
      )
    ])
  end

  it "renders a list of book_reviews" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
