class SignupController < ApplicationController
  def session1
    @user = User.new
    @profile = @user.build_profile
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
    
    @user = User.new
    @profile = @user.build_profile
  end

  def session4
    session[:tel] = profile_params[:tel]

    @user = User.new
    @profile = @user.build_profile
  end

  def session5
    session[:first_name] = profile_params[:first_name]
    session[:last_name] = profile_params[:last_name]
    session[:first_kana] = profile_params[:first_kana]
    session[:last_kana] = profile_params[:last_kana]
    session[:zipcode] = profile_params[:zipcode]
    session[:city] = profile_params[:city]
    session[:district] = profile_params[:district]
    session[:buiding] = profile_params[:buiding]

    @user = User.new
    @creditcard = @user.build_creditcard
  end

  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = @user.build_profile(
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_kana: session[:first_kana],
      last_kana: session[:last_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      zipcode: session[:zipcode],
      city: session[:city],
      district: session[:district],
      buiding: session[:buiding]
    )
    creditcard = @user.build_creditcard(creditcard_params)

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id])
      redirect_to products_path
    else
      redirect_to signup_index_path
    end
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

  def creditcard_params
    params.require(:creditcard).permit(
      :credit_number,
      :validity_month,
      :validity_day,
      :security_number
    )
  end
end
