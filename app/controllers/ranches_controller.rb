class RanchesController < ApplicationController
  def index
    @ranches = Ranch.order(created_at: :desc)
  end

  def show
    @ranch = Ranch.find(params[:id])
  end
end
