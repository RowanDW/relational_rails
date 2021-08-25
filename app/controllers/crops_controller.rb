class CropsController < ApplicationController

  def index
    @crops = Crop.all
  end

  def show
    @crop = Crop.find(params[:id])
  end
end
