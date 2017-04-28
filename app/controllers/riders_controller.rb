class RidersController < ApplicationController

  def index
    @driver = current_user.driver
    @riders = Rider.all.where(initial_location: @driver.initial_location, destination: @driver.destination)
  end
end
