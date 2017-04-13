class PhrasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @phrases = Phrase.all.order(id: :desc)
  end

  def new
    @phrase = Phrase.new
  end

  def show
    @phrase = Phrase.find(params[:id])
  end

  def create
    @phrase = Phrase.new(phrases_params)
    @phrase.user = current_user
    @phrase.save
    redirect_to phrases_path
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    @phrase = Phrase.find_by(id: params[:id])
    @phrase.update_attributes(phrases_params)
    redirect_to phrase_path(@phrase)
  end

  def destroy
    @phrase = Phrase.find_by(id: params[:id])
    @phrase.destroy
    redirect_to phrases_path
  end

  private

  def phrases_params
    params.require(:phrase).permit(:phrase, :translation, :votes, :category_id, examples_attributes: [:name, :translation, :_destroy]) #здесь должны передаваться вложенные аттрибуты с указанием разрешенных полей (из examples_params)
  end
end