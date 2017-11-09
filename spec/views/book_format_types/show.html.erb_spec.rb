require 'rails_helper'

RSpec.describe "book_format_types/show", type: :view do
  before(:each) do
    @book_format_type = assign(:book_format_type, BookFormatType.create!(
      :name => "Name",
      :physical => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
