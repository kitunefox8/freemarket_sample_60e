class Category < ApplicationRecord
  has_many :products
  # category_id, dependent: :destroy
  has_ancestry
  belongs_to :child, optional: true
end
