class SignupController < ApplicationController
  def session1
    @user = User.new
    @profile = Profile.new
  end
  def session2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]

    session[:first_name] = profile_params[:first_name]
    session[:last_name] = profile_params[:last_name]
    session[:first_kana] = profile_params[:first_kana]
    session[:last_kana] = profile_params[:last_kana]
    session[:birth_year] = profile_params[:birth_year]
    session[:birth_month] = profile_params[:birth_month]
    session[:birth_day] = profile_params[:birth_day]
    
    @profile = Profile.new
  end

  def session4
    session[:tel] = profile_params[:tel]

    @profile = Profile.new
  end
  
  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def profile_params
    params.require(:profile).permit(
      :first_name, 
      :last_name, 
      :first_kana, 
      :last_kana, 
      :birth_year, 
      :birth_month, 
      :birth_day,
      :tel,
      :zipcode,
      :prefecture,
      :city,
      :district,
      :building
  )
  end 
end
