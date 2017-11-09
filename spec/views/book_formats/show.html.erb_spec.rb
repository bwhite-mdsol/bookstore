require 'rails_helper'

RSpec.describe "book_formats/show", type: :view do
  before(:each) do
    @book_format = assign(:book_format, BookFormat.create!(
      :book_id => 2,
      :book_format_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
