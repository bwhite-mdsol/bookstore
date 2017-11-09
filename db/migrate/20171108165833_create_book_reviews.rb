class CreateBookReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :book_reviews do |t|
      t.integer :book_id
      t.integer :rating

      t.timestamps
    end
    add_index :book_reviews, :book_id
  end
end
