class RanchesController < ApplicationController
  def index
    @ranches = Ranch.order_created_at_desc
  end

  def show
    @ranch = Ranch.find(params[:id])
  end

  def new
  end

  def create
    Ranch.create(name: params[:name], max_capacity: params[:max_capacity], certified_humane: params[:certified_humane])
    redirect_to '/ranches'
  end

  # private
  # def ranch_params
  #   params.permit(:name)
  #   params.permit(:max_capacity)
  #   params.permit(:certified_humane)
  # end
end
