class SignupController < ApplicationController
  def session1
    @user = User.new
    @profile = Profile.new
  end
end
