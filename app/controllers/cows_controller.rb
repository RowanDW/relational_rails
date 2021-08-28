class CowsController < ApplicationController
  def index
    @cows = Cow.all_grass_fed
  end

  def show
    @cow = Cow.find(params[:id])
  end

  def edit
    @cow = Cow.find(params[:id])
  end

  def update
    cow = Cow.find(params[:id])
    cow.update(cow_params)
    redirect_to "/cows/#{cow.id}"
  end

  private
  def cow_params
    params.permit(:name, :age, :grass_fed)
  end
end
