require 'rails_helper'

RSpec.describe "book_format_types/index", type: :view do
  before(:each) do
    assign(:book_format_types, [
      BookFormatType.create!(
        :name => "Name",
        :physical => false
      ),
      BookFormatType.create!(
        :name => "Name",
        :physical => false
      )
    ])
  end

  it "renders a list of book_format_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
