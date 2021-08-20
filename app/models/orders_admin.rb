class OrdersAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :order
end
