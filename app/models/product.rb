class Product < ApplicationRecord
has_many :comments
has_many :likes
has_many :images
belongs_to :order, optional: true
accepts_nested_attributes_for :images
has_one :category
accepts_nested_attributes_for :category
has_one :status
accepts_nested_attributes_for :status
has_one :brand
accepts_nested_attributes_for :brand
end
