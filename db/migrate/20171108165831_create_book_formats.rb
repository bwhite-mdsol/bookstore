class CreateBookFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :book_formats do |t|
      t.integer :book_id
      t.integer :book_format_type_id

      t.timestamps
    end
    add_index :book_formats, :book_id
  end
end
