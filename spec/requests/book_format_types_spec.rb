require 'rails_helper'

RSpec.describe "BookFormatTypes", type: :request do
  describe "GET /book_format_types" do
    it "works! (now write some real specs)" do
      get book_format_types_path
      expect(response).to have_http_status(200)
    end
  end
end
