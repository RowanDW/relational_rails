class FarmCropsController < ApplicationController

  def index
    @farm = Farm.find(params[:id])
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
    params.permit(:name, :yield, :annual)
  end
end
