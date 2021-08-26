class RanchesController < ApplicationController
  def index
    @ranches = Ranch.all
  end

  def show
    @ranch = Ranch.find(params[:id])
  end
end
