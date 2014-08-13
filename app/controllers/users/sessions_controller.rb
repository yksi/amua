class Users::SessionsController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  def create
    @user = User.find(user_params)
    sign_in(@user)
    redirect_to @user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :avatar, :avatar_cache, :last_name, :age, :sex, :hometown, :email, :password, :pasword_confirmation) }
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :avatar_cache, :born_date, :sex, :hometown, :email, :password, :pasword_confirmation, :paused, :about, :prefer_lang, :uid)
  end
end