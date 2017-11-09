require "rails_helper"

RSpec.describe BookFormatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/book_formats").to route_to("book_formats#index")
    end

    it "routes to #new" do
      expect(:get => "/book_formats/new").to route_to("book_formats#new")
    end

    it "routes to #show" do
      expect(:get => "/book_formats/1").to route_to("book_formats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/book_formats/1/edit").to route_to("book_formats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/book_formats").to route_to("book_formats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/book_formats/1").to route_to("book_formats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/book_formats/1").to route_to("book_formats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/book_formats/1").to route_to("book_formats#destroy", :id => "1")
    end

  end
end
