class CowsController < ApplicationController
  def index
    if params[:exact_name].nil? && params[:partial_name].nil?
      @cows = Cow.all_grass_fed
    elsif params[:exact_name].nil?
      @cows = Cow.partial_name_search(params[:partial_name])
    else
      @cows = Cow.exact_name(params[:exact_name])
    end
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

  def destroy
    Cow.destroy(params[:id])
    redirect_to "/cows"
  end

  private
  def cow_params
    params.permit(:name, :age, :grass_fed)
  end
end
