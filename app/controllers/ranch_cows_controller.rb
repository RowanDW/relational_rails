class RanchCowsController < ApplicationController
  def index
    @ranch = Ranch.find(params[:id])
    if params[:sorted] == "true"
      @cows = @ranch.cows.sort_by_name
    elsif params[:age_threshold].nil?
      @cows = @ranch.cows
    else
      @cows = @ranch.cows.older_than(params[:age_threshold])
    end
  end

  def new
    @ranch = Ranch.find(params[:id])
  end

  def create
    ranch = Ranch.find(params[:id])
    ranch.cows.create(ranch_cows_params)
    redirect_to("/ranches/#{ranch.id}/cows")
  end

  private
  def ranch_cows_params
    params.permit(:name, :age, :grass_fed)
  end
end
