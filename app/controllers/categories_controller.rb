class CategoriesController < ApplicationController
  def index
    @catergories = Category.all.where(ancestry: nil)
  end
end
