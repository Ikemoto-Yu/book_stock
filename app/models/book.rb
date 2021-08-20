class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :orders_admins
  has_many :comments , dependent: :destroy
  with_options presence: true do
    validates :info
    validates :name
    validates :published_on
    validates :author_name
    validates :image
    validates :price ,  inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
      with_options numericality: { other_than: 1, message: "can't be blank" } do
        validates :category_id
        validates :appearance_id
      end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :appearance

  def self.search(search)
    if search != ""
      Book.where('name LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end
end
