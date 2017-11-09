require 'rails_helper'

RSpec.describe "book_format_types/new", type: :view do
  before(:each) do
    assign(:book_format_type, BookFormatType.new(
      :name => "MyString",
      :physical => false
    ))
  end

  it "renders new book_format_type form" do
    render

    assert_select "form[action=?][method=?]", book_format_types_path, "post" do

      assert_select "input[name=?]", "book_format_type[name]"

      assert_select "input[name=?]", "book_format_type[physical]"
    end
  end
end
