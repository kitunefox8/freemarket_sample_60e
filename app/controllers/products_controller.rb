class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_params, only: [:show, :buy, :edit, :update, :destroy, :buyer, :purchase, :seller, :city]
  after_action :buyer, only: [:purchase]
  include CommonActions
  before_action :set_categories

  def index
    @product = Product.all.order("id DESC").limit(20)
    @category = Category.all.where(ancestry: nil).limit(5).map{ |i| [i.id, i.name] }
    @product_category_ladies = Product.where(category_id: [Category.find(1).descendant_ids]).order('id Desc').limit(10)
    @category_ladies = Category.find(1)
    @product_category_mens = Product.where(category_id: [Category.find(200).descendant_ids]).order('id Desc').limit(10)
    @category_mens = Category.find(200)
    @product_category_kids = Product.where(category_id: [Category.find(346).descendant_ids]).order('id Desc').limit(10)
    @category_kids = Category.find(346)
    @product_category_interior = Product.where(category_id: [Category.find(481).descendant_ids]).order('id Desc').limit(10)
    @category_interior = Category.find(481)
    @product_category_toy = Product.where(category_id: [Category.find(625).descendant_ids]).order('id Desc').limit(10)
    @category_toy = Category.find(625) 
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

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show 
    @images = @product.images
    @user = Product.where(saller_id: @product.saller_id).where.not(id: @product.id).order("id DESC").limit(9)
    @category = Product.where(category_id: @product.category_id).where.not(id: @product.id).order("id DESC").limit(9)
    @message = Comment.new 
    @comment = @product.comments.includes(:user)
  end
   
  def city
   if @product.update(profile_id: current_user.profile.id)
    redirect_to buy_products_path(@product.id)
   else 
      redirect_to action: :index
   end
  end

  def buy
  end
  
  def buyer
    @product.update(buyer: 1, buyer_id: current_user.id)
  end

  def create
    @product = Product.new(create_params)
    if @product.images.blank? or @product.brand.blank? or @product.status.blank? or @product.category_id.blank? or @product.category_id == 0 or @product.price.to_i <= 300
      redirect_to action: :new
    else 
      @product.save
      redirect_to action: :index
    end
  end

  def edit
    @category_list = Category.all.where(ancestry: nil).map{|i| [i.name, i.id]}
  end

  def update
    @product.update(update_params) 
    if @product.images.blank? or @product.brand.blank? or @product.status.blank? or @product.category_id.blank? or @product.category_id == 0 or @product.price.to_i <= 300
      render :new  
    else
      redirect_to action: :index
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
