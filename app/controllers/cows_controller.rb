class CowsController < ApplicationController
  def index
    @cows = Cow.all
  end
end
