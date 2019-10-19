class ProductsController < ApplicationController
  def index
    @product = Product.all.order("id DESC")
  end

  def new
    @product = Product.new
    @product.build_category
    @product.build_status
    @product.build_brand
    @product.images.build
  end

  def show
    @product = Product.find(params[:id])  
  end
  def buy
    @product = Product.find(params[:id])
  end
  
  def buyer
    @product = Product.find(params[:id])
    if @product.update(buyer: 1)
    redirect_to action: :index
    else
    redirect_to action: :index
    end
  end
  def create
    @product = Product.new(create_params)

    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end
  def edit
    @product = Product.find(params[:id])  
  end
  def update
    @product = Product.find(params[:id])  
    if @product.update(update_params) 
      redirect_to action: :index
    else
      render :new
    end
  end  
  def destroy
    @product = Product.find(params[:id])  
    if @product.destroy 
      redirect_to action: :index
    end
  end

  private
  def create_params
    params.require(:product).permit(
      :name, :price, :delivery, :description, :exposition, :delivery_fee, :shipping_area, :shipping_days, :saller_id, :buyer,
      category_attributes: [:id, :name],
      status_attributes: [:id, :name],
      brand_attributes: [:id, :name],
      images_attributes: [:id, :image_url]
    )
  end
  def update_params
    params.require(:product).permit(
     :name, :price, :delivery, :description, :exposition, :delivery_fee, :shipping_area, :shipping_days, :saller_id, :buyer,
     category_attributes: [:id, :name],
     status_attributes: [:id, :name],
     brand_attributes: [:id, :name],
     images_attributes: [:id, :image_url]
   )
  end
end
