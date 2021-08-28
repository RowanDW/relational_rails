class CropsController < ApplicationController

  def index
    @crops = Crop.all
  end

  def show
    @crop = Crop.find(params[:id])
  end

  def edit
    @crop = Crop.find(params[:id])
  end

  def update
    crop = Crop.find(params[:id])
    crop.update(crop_params)
    redirect_to "/crops/#{crop.id}"
  end

  private
  def crop_params
    params.permit(:name, :yield, :annual)
  end
end
