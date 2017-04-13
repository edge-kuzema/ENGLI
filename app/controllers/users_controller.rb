class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    byebug
    @user = User.new(users_params)
    @user.save
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(users_params)
    @user.save
    redirect_to @user
  end

  private

  def users_params
    params.require(:user).permit(:name, :activity, :expertise, :avatar)
  end
end

