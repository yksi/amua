class UsersController < ApplicationController
  before_action :find_user, only: :show

  def index
    @users = User.order(created_at: :desc)
  end

  def login

  end

  def sign_up
    redirect_to users_register_path
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to @user
    end
  end

  def register

  end

  def show
    @posts = @user.owned_posts.order(created_at: :desc)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end