class FarmsController < ApplicationController

  def index
    @farms = Farm.order(created_at: :desc)
  end

  def show
    @farm = Farm.find(params[:id])
  end

end
