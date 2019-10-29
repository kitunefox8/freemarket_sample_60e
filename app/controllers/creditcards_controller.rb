class CreditcardsController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :set_params, only: [:edit, :update]

  def edit
  end

  def update
    if @creditcard.update(update_params) 
      redirect_to mypage_user_path(current_user)
    else
      render :edit
    end
  end

private
  def update_params
    params.require(:creditcard).permit(
      :credit_number, :validity_month, :validity_day, :security_number
    )
  end

  def set_params
    @creditcard = Creditcard.find(params[:id])
  end
end
