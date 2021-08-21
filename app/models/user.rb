class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         has_many :books
         has_many :comments
         has_many :orders_admins
         has_many :sns_credentials
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
         def self.from_omniauth(auth)
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
          user = User.where(email: auth.info.email).first_or_initialize(
            nickname: auth.info.name,
              email: auth.info.email
          )
          if user.persisted?
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }
         end
end
