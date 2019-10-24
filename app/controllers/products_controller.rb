class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_params, only: [:show, :buy, :edit, :update, :destroy, :buyer, :purchase,:seller]
  after_action :buyer, only: [:purchase]

  def index
    @product = Product.all.order("id DESC")
    @parents = Category.all.order("id ASC").limit(13)
  end
 
  def  shipping
    @product = Product.find(params[:id])  
   if @product.update(buyer: 2)
     redirect_to action: :index
  else
    redirect_to action: :new
  end
 end

  def new
    @product = Product.new
    @product.build_status
    @product.build_brand
    @product.images.build
    @category_list = Category.all.where(ancestry: nil).map{|i| [i.name, i.id]}
  end

  def show 
  end

  def buy
  end
  
  def buyer
    @product.update(buyer: 1, buyer_id: current_user.id)
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
  end

  def update
    if @product.update(update_params) 
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    if @product.destroy 
      redirect_to root_path
    end
  end

  def purchase
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(currency: 'jpy', amount: @product.price, card: params['payjp-token'])
    redirect_to root_path
  end
  
  def seller
    if @product.update(buyer: 0)
       redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  private
  def create_params
    params.require(:product).permit(
      :name, :price, :delivery, :description, :exposition, :delivery_fee, :shipping_area, :shipping_days, :buyer, :category_id,
      status_attributes: [:id, :name],
      brand_attributes: [:id, :name],
      images_attributes: [:id, :image_url]
    )
    .merge(saller_id: current_user.id,user_id: current_user.id, buyer: 0)
  end
  def update_params
    params.require(:product).permit(
     :name, :price, :delivery, :description, :exposition, :delivery_fee, :shipping_area, :shipping_days,:buyer, :category_id,
     status_attributes: [:id, :name],
     brand_attributes: [:id, :name],
     images_attributes: [:id, :image_url]
   )
  end

  def set_params
    @product = Product.find(params[:id])  
  end

end
