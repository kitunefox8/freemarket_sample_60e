class CategoriesController < ApplicationController
  def index
    @categories = Category.all.where(ancestry: nil)
  end
end
