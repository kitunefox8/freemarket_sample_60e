class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_params, only: [:show, :buy, :edit, :update, :destroy, :buyer, :purchase,:seller]
  after_action :buyer, only: [:purchase]
  include CommonActions
  before_action :set_categories

  def index
    @product = Product.all.order("id DESC").limit(20)
    @category_5 = Category.all.where(ancestry: nil).limit(5).map{|i| [i.id, i.name]}
    @ladies = Product.all.where(category_id: '1').order("id DESC").limit(10)
    @mans = Product.all.where(category_id: '200').order("id DESC").limit(10)
    @kids = Product.all.where(category_id: '346').order("id DESC").limit(10)
    @interi = Product.all.where(category_id: '481').order("id DESC").limit(10)
    @book = Product.all.where(category_id: '625').order("id DESC").limit(10)
  end
  def serach
    redirect_to root_path if params[:keyword].blank?
    @product = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("id DESC").limit(10)
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
    @images = @product.images
    @user = Product.where(saller_id: @product.saller_id).where.not(id: @product.id).order("id DESC").limit(9)
    @category = Product.where(category_id: @product.category_id).where.not(id: @product.id).order("id DESC").limit(9)
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
