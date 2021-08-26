class RanchCowsController < ApplicationController
  def index
    @ranch = Ranch.find(params[:ranch_id])
  end
end
