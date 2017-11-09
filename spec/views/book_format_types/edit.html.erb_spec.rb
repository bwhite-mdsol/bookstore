require 'rails_helper'

RSpec.describe "book_format_types/edit", type: :view do
  before(:each) do
    @book_format_type = assign(:book_format_type, BookFormatType.create!(
      :name => "MyString",
      :physical => false
    ))
  end

  it "renders the edit book_format_type form" do
    render

    assert_select "form[action=?][method=?]", book_format_type_path(@book_format_type), "post" do

      assert_select "input[name=?]", "book_format_type[name]"

      assert_select "input[name=?]", "book_format_type[physical]"
    end
  end
end
