class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.build_category
    @product.build_status
    @product.build_brand
    @product.build_image
  end

  def show
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      redirect_to new_product_path
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:product).permit(
      :image, :name, :price, :description, :exposition, :delivery_fee, :delivery, :shipping_area, :shipping_days, :saller_id,
      category_attributes: [:id, :name],
      status_attributes: [:id, :name],
      brand_attributes: [:id, :name],
      image_attributes: [:id, :image_url]
    )
  end
end
