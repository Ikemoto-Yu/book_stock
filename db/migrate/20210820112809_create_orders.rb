class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :phone_number , null: false
      t.references :orders_admin , null: false , foreign_key: true
      t.timestamps
    end
  end
end
