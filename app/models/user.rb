class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = Snscredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        Snscredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        password = Devise.friendly_token[0, 20]
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: password,
          password_confirmation: password
          )
        Snscredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

  has_many :products
  has_many :tradings
  has_many :comments
  has_many :likes
  has_many :snscredentials, dependent: :destroy
  # has_one :creditcard, dependent: :destory
  has_one :creditcard
  accepts_nested_attributes_for :creditcard
  # has_one :profile, dependent: :destory
  has_one :profile
  accepts_nested_attributes_for :profile

  email_check = /\A[^@\s]+@[^@\s]+\z/
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: email_check }
  validates :email,                 presence: true
  validates :password,              presence: true, length: {minimum: 7, maximum: 128}
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  # validates :nickname,              presence: true, length: {maximum: 20}
  validates :nickname,              presence: true
end
