class Category < ApplicationRecord
  has_many :products
  belongs_to :child, optional: true
end
