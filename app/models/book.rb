class Book < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :info
    validates :name
    validates :price ,  inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :published_on
    validates :author_name
    validates :category
    validates :appearance
  end
end
