class Category < ApplicationRecord
  has_many :products
  has_ancestry
  belongs_to :child, optional: true
end