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
  has_one :creditcard, dependent: :destory
  has_one :profile, dependent: :destory
end
