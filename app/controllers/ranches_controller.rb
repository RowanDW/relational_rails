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
    Ranch.create(ranch_params)
    redirect_to '/ranches'
  end

  def edit
    @ranch = Ranch.find(params[:id])
  end

  def update
    ranch = Ranch.find(params[:id])
    ranch.update(ranch_params)
    redirect_to "/ranches/#{ranch.id}"
  end

  def destroy
    Ranch.destroy(params[:id])
    redirect_to '/ranches'
  end

  private
  def ranch_params
    params.permit(:name, :max_capacity, :certified_humane)
  end
end
