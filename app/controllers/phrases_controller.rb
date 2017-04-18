class PhrasesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @phrases = Phrase.where(user_id: params[:user_id])
      @phrases = Kaminari.paginate_array(@phrases.sort_by{|phrase| phrase.score}.reverse).page(params[:page]).per(10)
    else
      @phrases = Phrase.all
      @phrases = Kaminari.paginate_array(@phrases.sort_by{|phrase| phrase.score}.reverse).page(params[:page]).per(10)
    end
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
    current_user.update_attribute(:activ, current_user.activ + 10 )
    redirect_to phrases_path
  end

  def edit
    @phrase = Phrase.find_by(id: params[:id])
  end

  def update
    @phrase = Phrase.find_by(id: params[:id])
    @phrase.update_attributes(phrases_params)
    @phrase.create_activity key: "The new example has been add to your phrase <span>'#{@phrase.phrase}'</span> by #{current_user.name}", owner: current_user, recipient: @phrase.user
    current_user.update_attribute(:activ, current_user.activ + 4 )
    redirect_to phrase_path(@phrase)
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy
    redirect_to (:back)
  end

  def upvote
    @phrase = Phrase.find(params[:id])
    if Vote.where(votable_type: "Phrase", votable_id: @phrase.id, voter_id: current_user.id, vote_flag: true ).blank?
      @phrase.user.update_attribute(:expertise, @phrase.user.expertise + 3 )
      current_user.update_attribute(:activ, current_user.activ + 1 )
    end
    @phrase.upvote_by current_user
    @phrase.create_activity key: "The phrase <span>'#{@phrase.short_name}'</span> has been liked by #{current_user.name}", owner: current_user, recipient: @phrase.user

    redirect_to (:back)
  end

  def downvote
    @phrase = Phrase.find(params[:id])
    if Vote.where(votable_type: "Phrase", votable_id: @phrase.id, voter_id: current_user.id, vote_flag: false).blank?
    @phrase.user.update_attribute(:expertise, @phrase.user.expertise - 3 )
     current_user.update_attribute(:activ, current_user.activ - 1 )
    end
    @phrase.downvote_by current_user
    @phrase.create_activity key: "The phrase <span>'#{@phrase.short_name}'</span> has been disliked by #{current_user.name}", owner: current_user, recipient: @phrase.user
    redirect_to (:back)
  end

  def newest
    @phrases = Phrase.all.order(updated_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  private

  def phrases_params
    params.require(:phrase).permit(:phrase, :translation, :votes, :category_id, examples_attributes: [:name, :translation, :_destroy], notifications_attributes: [:name, :action, :read]) #здесь должны передаваться вложенные аттрибуты с указанием разрешенных полей (из examples_params)
  end
end