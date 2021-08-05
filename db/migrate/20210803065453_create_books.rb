class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|

      t.string :name , null: false
      t.text :info , null: false
      t.integer :price , null: false
      t.date :published_on , null: false
      t.string :author_name , null: false
      t.string :category , null: false
      t.integer :appearance , null: false
      t.timestamps
    end
  end
end
