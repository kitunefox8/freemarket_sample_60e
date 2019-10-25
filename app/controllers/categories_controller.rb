class CategoriesController < ApplicationController
  include CommonActions
  before_action :set_categories

  def index
  end

  def show
    @category = Category.find(params[:id])
  end
  
end
