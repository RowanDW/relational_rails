class FarmsController < ApplicationController

  def index
    if params[:crop_sort] == 'true'
      @farms = Farm.order_crop_count
    elsif params[:exact_search].nil? && params[:partial_search].nil?
      @farms = Farm.order_created_at_desc
    elsif params[:partial_search].nil?
      @farms = Farm.exact_name_search(params[:exact_search])
    else
      @farms = Farm.partial_name_search(params[:partial_search])
    end
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
  end

  def create
    Farm.create(farm_params)
    redirect_to '/farms'
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    farm = Farm.find(params[:id])
    farm.update(farm_params)
    redirect_to "/farms/#{farm.id}"
  end

  def destroy
    Farm.destroy(params[:id])
    redirect_to '/farms'
  end

  private
  def farm_params
    params.permit(:name, :acres, :organic)
  end
end
