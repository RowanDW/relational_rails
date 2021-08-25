class FarmCropsController < ApplicationController

  def index
    @farm = Farm.find(params[:id])
  end
end
