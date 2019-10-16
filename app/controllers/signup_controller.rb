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

    session[:first_name] = user_params[:profile][:first_name]
    session[:last_name] = user_params[:profile][:last_name]
    session[:first_kana] = user_params[:profile][:first_kana]
    session[:last_kana] = user_params[:profile][:last_kana]
    session[:birth_year] = user_params[:profile][:birth_year]
    session[:birth_month] = user_params[:profile][:birth_month]
    session[:birth_day] = user_params[:profile][:birth_day]
    
    @user = User.new
    @profile = @user.build_profile
  end

  def session4
    session[:tel] = user_params[:profile][:tel]

    @user = User.new
    @profile = @user.build_profile
  end

  def session5
    session[:first_name] = user_params[:profile][:first_name]
    session[:last_name] = user_params[:profile][:last_name]
    session[:first_kana] = user_params[:profile][:first_kana]
    session[:last_kana] = user_params[:profile][:last_kana]
    session[:zipcode] = user_params[:profile][:zipcode]
    session[:prefecture] = user_params[:profile][:prefecture]
    session[:city] = user_params[:profile][:city]
    session[:district] = user_params[:profile][:district]
    session[:building] = user_params[:profile][:building]
   
    @user = User.new
    @creditcard = @user.build_creditcard
  end

  def create
    session[:credit_number] = user_params[:creditcard][:credit_number]
    session[:validity_month] = user_params[:creditcard][:validity_month]
    session[:validity_day] = user_params[:creditcard][:validity_day]
    session[:security_number] = user_params[:creditcard][:security_number]

    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]

      # profile: session[:first_name],
      # last_name: session[:last_name],
      # first_kana: session[:first_kana],
      # last_kana: session[:last_kana],
      # birth_year: session[:birth_year],
      # birth_month: session[:birth_month],
      # birth_day: session[:birth_day],
      # zipcode: session[:zipcode],
      # city: session[:city],
      # district: session[:district],
      # buiding: session[:buiding],
      # credit_number: session[:credit_number],
      # validity_month: session[:validity_month],
      # validity_day: session[:validity_day],
      # security_number: session[:security_number]
    )
    @profile = @user.build_profile(
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_kana: session[:first_kana],
      last_kana: session[:last_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      prefecture: session[:prefecture],
      zipcode: session[:zipcode],
      city: session[:city],
      district: session[:district],
      building: session[:building],
      tel: session[:tel]
    )
    @creditcard = @user.build_creditcard(
      credit_number: session[:credit_number],
      validity_month: session[:validity_month],
      validity_day: session[:validity_day],
      security_number: session[:security_number]
    )

    if @user.save && @profile.save && @creditcard.save
      session[:id] = @user.id
      sign_in User.find(session[:id])
      redirect_to root_path
    else
      redirect_to signup_index_path
    end
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      profile: [:first_name, :last_name, :first_kana, :last_kana, :birth_year, :birth_month, :birth_day, :tel, :zipcode, :prefecture, :city, :district, :building],
      creditcard: [:credit_number, :validity_month, :validity_day, :security_number]

      # profile_attributes: [:id, :first_name],
      # profile_attributes: [:id, :last_name],
      # profile_attributes: [:id, :first_kana],
      # profile_attributes: [:id, :last_kana],
      # profile_attributes: [:id, :birth_year],
      # profile_attributes: [:id, :birth_month],
      # profile_attributes: [:id, :birth_day],
      # profile_attributes: [:id, :tel],
      # profile_attributes: [:id, :zipcode],
      # profile_attributes: [:id, :city],
      # profile_attributes: [:id, :district],
      # profile_attributes: [:id, :buiding],
      # creditcard_attributes: [:id, :credit_number],
      # creditcard_attributes: [:id, :validity_month],
      # creditcard_attributes: [:id, :validity_day],
      # creditcard_attributes: [:id, :security_number]

    )
  end

  # def profile_params
  #   params.require(:profile).permit(
  #     :first_name, 
  #     :last_name, 
  #     :first_kana, 
  #     :last_kana, 
  #     :birth_year, 
  #     :birth_month, 
  #     :birth_day,
  #     :tel,
  #     :zipcode,
  #     :prefecture,
  #     :city,
  #     :district,
  #     :building
  # )
  # end

  # def creditcard_params
  #   params.require(:creditcard).permit(
  #     :credit_number,
  #     :validity_month,
  #     :validity_day,
  #     :security_number
  #   )
  # end
end
