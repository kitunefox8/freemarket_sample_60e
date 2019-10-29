class ProfilesController < ApplicationController
  include CommonActions
  before_action :set_categories
  before_action :set_params, only: [:edit, :update]
  
  def edit
  end

  def update
    if @profile.update(update_params) 
      redirect_to mypage_user_path(current_user)
    else
      render :edit
    end
  end

private
  def update_params
    params.require(:profile).permit(
      :tel,:zipcode, :prefecture, :city, :district, :building
    )
  end

  def set_params
    @profile = Profile.find(params[:id])
  end
end
