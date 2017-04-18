class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all.order("created_at desc").where(owner_type: "User")
  end

  def destroy
    @activity = PublicActivity::Activity.find(params[:id])
    @activity.destroy
    redirect_to (:back)
  end

end
