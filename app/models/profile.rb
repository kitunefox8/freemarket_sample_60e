class Profile < ApplicationRecord
  belongs_to :user, optional: true

  tel_check = /\A\d{11}\z/
  zipcode_check = /\A\d{3}[-]\d{4}\z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :tel, format: { with: tel_check }
  validates :zipcode, presence: true, format:{ with: zipcode_check }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :district, presence: true
end
