class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :phone_number
      t.references :orders_admins
      t.timestamps
    end
  end
end
