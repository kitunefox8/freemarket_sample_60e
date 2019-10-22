class Product < ApplicationRecord
has_many :comments
has_many :likes
has_many :images, foreign_key: :product_id, dependent: :destroy
belongs_to :order, optional: true
accepts_nested_attributes_for :images
belongs_to :category, optional: true
# has_one :category,  dependent: :destroy
# accepts_nested_attributes_for :category
has_one :status,  dependent: :destroy
accepts_nested_attributes_for :status
has_one :brand,  dependent: :destroy
accepts_nested_attributes_for :brand
end
