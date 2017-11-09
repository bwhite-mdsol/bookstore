require 'rails_helper'

RSpec.describe "BookFormats", type: :request do
  describe "GET /book_formats" do
    it "works! (now write some real specs)" do
      get book_formats_path
      expect(response).to have_http_status(200)
    end
  end
end
