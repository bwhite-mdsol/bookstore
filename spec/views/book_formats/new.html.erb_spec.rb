require 'rails_helper'

RSpec.describe "book_formats/new", type: :view do
  before(:each) do
    assign(:book_format, BookFormat.new(
      :book_id => 1,
      :book_format_type_id => 1
    ))
  end

  it "renders new book_format form" do
    render

    assert_select "form[action=?][method=?]", book_formats_path, "post" do

      assert_select "input[name=?]", "book_format[book_id]"

      assert_select "input[name=?]", "book_format[book_format_type_id]"
    end
  end
end
