class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :orders_admin
end
