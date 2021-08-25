class RanchesController < ApplicationController
  def index
    @ranches = Ranch.all
  end
end
