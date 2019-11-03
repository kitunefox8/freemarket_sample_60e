class Creditcard < ApplicationRecord
  belongs_to :user, optional: true
  creditcard_check = /\A[0-9]+\z/
  validates :credit_number, presence: true, length: { maximum: 20 }, format: { with: creditcard_check }, on: :create
  validates :validity_month, presence: true, on: :create
  validates :validity_day, presence: true, on: :create
  validates :security_number, presence: true, length: { maximum: 4 }, format: { with: creditcard_check }, on: :create
end
