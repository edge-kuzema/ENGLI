class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if @user = current_user
      current_user
      @activities = PublicActivity::Activity.where(recipient_type: 'User', recipient_id: current_user.id)
    else
      redirect_to user_phrases_path
    end
  end

  def create
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

