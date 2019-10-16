class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :tradings
  has_many :comments
  has_many :likes
  has_many :sns_credentials
  # has_one :creditcard, dependent: :destory
  has_one :creditcard
  accepts_nested_attributes_for :creditcard
  # has_one :profile, dependent: :destory
  has_one :profile
  accepts_nested_attributes_for :profile

  email_check = /\A[^@\s]+@[^@\s]+\z/
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: email_check }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128}
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  validates :nickname,              presence: true, length: {maximum: 20}
end
