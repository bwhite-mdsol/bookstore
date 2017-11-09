# README

## Required Elements

Book model found in `app/models/book.rb`

Book migration found in `db/migrate/20171108165836_create_books.rb`

Book model's `book_format_types` method is provided via `has_many ... through`

## Optional Spec

Spec for books model found in `spec/models/book_spec.rb`

bundle exec rspec spec/models/book_spec.rb
```
................

Finished in 0.06895 seconds (files took 1.73 seconds to load)
16 examples, 0 failures
```

## Setup

Gemfile:
```
source 'https://rubygems.org'

gem "rails",                "~> 5.0"
gem "rspec"
gem "rspec-rails"
```

In shell:
```
bundle install
bundle exec rails new bookstore
cd bookstore
````

Add ‘spec’, ‘spec-rails’ to Gemfile

In shell:
```
bundle install
bundle exec rails generate scaffold Publisher name:string:index
bundle exec rails generate scaffold Author first_name:string last_name:string:index
bundle exec rails generate scaffold BookFormatType name:string physical:boolean
bundle exec rails generate scaffold BookFormat book_id:integer:index book_format_type_id:integer
bundle exec rails generate scaffold BookReview book_id:integer:index rating:integer
bundle exec rails generate scaffold Book title:string:index publisher_id:integer author_id:integer
bundle exec rails generate rspec:install
```

Add ‘validates_numericality_of :rating, allow_nil: false’ to app/models/book_review.rb

Make other edits to `app/model/book.rb` and `spec/models/book_spec.rb`

