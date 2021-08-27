class RanchesController < ApplicationController
  def index
    @ranches = Ranch.order_desc_created_at
  end

  def show
    @ranch = Ranch.find(params[:id])
  end
end
