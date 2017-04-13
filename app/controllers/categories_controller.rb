class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


  def index
    @categories = Category.all.order(id: :desc)
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(categories_params)
    @category.save
    redirect_to categories_path
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy
    redirect_to categories_path
  end

  private
  def categories_params
    params.require(:category).permit(:name, :category_id)
  end
end