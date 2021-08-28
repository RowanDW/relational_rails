class FarmsController < ApplicationController

  def index
    @farms = Farm.order_created_at_desc
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

  private
  def farm_params
    params.permit(:name, :acres, :organic)
  end
end
