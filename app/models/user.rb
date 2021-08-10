class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :books
         with_options presence: true do
           validates :nickname
           validates :email
           validates :password
           validates :password_confirmation
             with_options  format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
             validates :first_name
             validates :last_name
             end
         end
end
