require 'rails_helper'

RSpec.describe "book_formats/edit", type: :view do
  before(:each) do
    @book_format = assign(:book_format, BookFormat.create!(
      :book_id => 1,
      :book_format_type_id => 1
    ))
  end

  it "renders the edit book_format form" do
    render

    assert_select "form[action=?][method=?]", book_format_path(@book_format), "post" do

      assert_select "input[name=?]", "book_format[book_id]"

      assert_select "input[name=?]", "book_format[book_format_type_id]"
    end
  end
end
