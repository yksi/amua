class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user?(user)
    if user_signed_in? and current_user == user
      true
    else
      false
    end
  end
end
