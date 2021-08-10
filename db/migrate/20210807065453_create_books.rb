class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|

      t.string :name , null: false
      t.text :info , null: false
      t.integer :price , null: false
      t.date :published_on , null: false
      t.string :author_name , null: false
      t.integer :category_id , null: false
      t.integer :appearance_id , null: false
      t.references :user , null: false , foreign_key: true
      t.timestamps
    end
  end
end
