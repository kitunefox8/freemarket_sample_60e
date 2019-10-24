class Category < ApplicationRecord
  has_many :products
  has_ancestry
  # category_id, dependent: :destroy
  # belongs_to :child, optional: true
end
