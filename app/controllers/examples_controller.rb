class ExamplesController < ApplicationController


  def destroy
    @example = Example.find(params[:phrase_id])
    @example.destroy
    redirect_to (:back)
  end

  def upvote
    @example = Example.find(params[:phrase_id])
    @example.upvote_by current_user
    @example.phrase.user.update_attribute(:expertise, @example.phrase.user.expertise + 1 )
    @example.create_activity key: "The example <span>'#{@example.name}'</span> has been liked by #{current_user.name}", owner: current_user, recipient: @example.phrase.user
    redirect_to (:back)
  end

  def downvote
    @example = Example.find(params[:phrase_id])
    @example.downvote_by current_user
    @example.phrase.user.update_attribute(:expertise, @example.phrase.user.expertise - 1 )
    @example.create_activity key: "The example <span>'#{@example.name}'</span> has been disliked by #{current_user.name}", owner: current_user, recipient: @example.phrase.user
    redirect_to (:back)
  end

  private
  def examples_params
    params.require(:example).permit(:name, :translation)
  end

end

