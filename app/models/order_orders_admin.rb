class OrderOrdersAdmin
  include ActiveModel::Model
  attr_accessor :book_id, :user_id, :phone_number, :token
  with_options presence: true do
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :book_id
  end

  def save
    orders_admin = OrdersAdmin.create(book_id: book_id, user_id: user_id)
    Order.create(phone_number: phone_number, orders_admin_id: orders_admin.id)
  end

end