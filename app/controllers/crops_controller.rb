class CropsController < ApplicationController

  def index
    if params[:exact_search].nil? && params[:partial_search].nil?
      @crops = Crop.only_annuals
    elsif params[:partial_search].nil?
      @crops = Crop.exact_name_search(params[:exact_search])
    else
      @crops = Crop.partial_name_search(params[:partial_search])
    end
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

  def destroy
    Crop.destroy(params[:id])
    redirect_to '/crops'
  end

  private
  def crop_params
    params.permit(:name, :yield, :annual)
  end
end
