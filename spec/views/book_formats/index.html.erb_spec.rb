require 'rails_helper'

RSpec.describe "book_formats/index", type: :view do
  before(:each) do
    assign(:book_formats, [
      BookFormat.create!(
        :book_id => 2,
        :book_format_type_id => 3
      ),
      BookFormat.create!(
        :book_id => 2,
        :book_format_type_id => 3
      )
    ])
  end

  it "renders a list of book_formats" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
