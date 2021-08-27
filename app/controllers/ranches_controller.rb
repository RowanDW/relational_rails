class RanchesController < ApplicationController
  def index
    @ranches = Ranch.order_created_at_desc
  end

  def show
    @ranch = Ranch.find(params[:id])
  end
end
