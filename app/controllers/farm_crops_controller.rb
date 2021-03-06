class FarmCropsController < ApplicationController

  def index
    @farm = Farm.find(params[:id])

    if params[:alphabetical] == 'true'
      @crops = @farm.crops.alphabatize_crops
    elsif params[:yield_threshold].nil?
      @crops = @farm.crops
    else
      @crops = @farm.crops.yield_threshold(params[:yield_threshold])
    end
  end

  def new
    @farm = Farm.find(params[:id])
  end

  def create
    farm = Farm.find(params[:id])
    farm.crops.create(farm_crops_params)
    redirect_to "/farms/#{farm.id}/crops"
  end

  private
  def farm_crops_params
    params.permit(:name, :yield, :annual, :alphabetical)
  end
end
