class CowsController < ApplicationController
  def index
    @cows = Cow.all
  end

  def show
    @cow = Cow.find(params[:id])
  end
end
