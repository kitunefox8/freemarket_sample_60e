class Product < ApplicationRecord
has_many :comments
has_many :likes
has_many :images
belongs_to :order, optional: true
belongs_to :category
belongs_to :status
belongs_to :brand
accepts_nested_attributes_for :category
accepts_nested_attributes_for :status
accepts_nested_attributes_for :brand
accepts_nested_attributes_for :images
end
