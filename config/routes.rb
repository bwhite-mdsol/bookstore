Rails.application.routes.draw do
  resources :books
  resources :book_reviews
  resources :book_formats
  resources :book_format_types
  resources :authors
  resources :publishers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
