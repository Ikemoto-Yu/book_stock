class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments , dependent: :destroy
  with_options presence: true do
    validates :info
    validates :name
    validates :published_on
    validates :author_name
      with_options numericality: { other_than: 1, message: "can't be blank" } do
        validates :category_id
        validates :appearance_id
      end
    validates :price ,  inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :appearance
end
