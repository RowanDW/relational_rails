class FarmsController < ApplicationController

  def index
    @farms = Farm.order_desc_created_at
  end

  def show
    @farm = Farm.find(params[:id])
  end
end
