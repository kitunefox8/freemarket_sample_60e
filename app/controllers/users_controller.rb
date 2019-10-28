class UsersController < ApplicationController
  include CommonActions
  before_action :set_categories

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
     @products = current_user.products.all
     @product = Product.where(buyer_id: current_user.id).where(buyer: 1)
    end
  
end
