class FarmsController < ApplicationController

  def index
    @farms = Farm.order_created_at_desc
  end

  def show
    @farm = Farm.find(params[:id])
  end
end
