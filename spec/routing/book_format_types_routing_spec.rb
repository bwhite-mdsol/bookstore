require "rails_helper"

RSpec.describe BookFormatTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/book_format_types").to route_to("book_format_types#index")
    end

    it "routes to #new" do
      expect(:get => "/book_format_types/new").to route_to("book_format_types#new")
    end

    it "routes to #show" do
      expect(:get => "/book_format_types/1").to route_to("book_format_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/book_format_types/1/edit").to route_to("book_format_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/book_format_types").to route_to("book_format_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/book_format_types/1").to route_to("book_format_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/book_format_types/1").to route_to("book_format_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/book_format_types/1").to route_to("book_format_types#destroy", :id => "1")
    end

  end
end
