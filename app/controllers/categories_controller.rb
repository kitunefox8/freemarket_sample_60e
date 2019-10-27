class CategoriesController < ApplicationController
  include CommonActions
  before_action :set_categories

  def index
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.all.order("id DESC")
    if @category.has_children?
      @products = Product.all.where(category_id: @category.descendant_ids).order("id DESC").page(params[:page]).per(10))
    else
      @products = Product.all.where(category_id: @category.id).order("id DESC").page(params[:page]).per(10)
    end
  end
  
end
