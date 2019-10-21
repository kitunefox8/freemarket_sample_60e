class Category < ApplicationRecord
  has_many :products
  # category_id, dependent: :destroy
  belongs_to :child, optional: true
end
