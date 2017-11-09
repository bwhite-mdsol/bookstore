class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publisher_id
      t.integer :author_id

      t.timestamps
    end
    add_index :books, :title
  end
end
