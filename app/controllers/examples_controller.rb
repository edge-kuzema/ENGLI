class ExamplesController < ApplicationController

  def create
    @example = Example.new(examples_params)
    @example.save
  end

  def destroy
    @example = Example.find(params[:phrase_id])
    @example.destroy
    redirect_to (:back)
  end

  private
  def examples_params
    params.require(:example).permit(:name, :translation)
  end

end

