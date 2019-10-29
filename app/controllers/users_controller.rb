class UsersController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :set_params, only: [:edit, :update]

  def seller
    @product = Product.where(saller_id: current_user.id).where(buyer: 0)
  end

  def negotiation
    @product = Product.where(saller_id: current_user.id).where(buyer: 1)
  end

  def buy
    @product = Product.where(buyer_id: current_user.id).where(buyer: 1)
  end

  def sold
    @product = Product.where(buyer_id: current_user.id).where(buyer: 2)
  end

  def sell
    @product = Product.where(saller_id: current_user.id ).where(buyer: 2 )
  end
 
  def mypage
    @products = current_user.products
    @product = Product.where(buyer_id: current_user.id,buyer: 1)
  end

  def edit
  end

  def update
    if @user.update(update_params)
      redirect_to mypage_user_path(current_user)
    else
      render :edit
    end
  end
  
  private
  def update_params
    params.require(:user).permit(:avator, :callout, :self_introduction)
  end

  def set_params
    @user = User.find(params[:id]) 
  end

end
