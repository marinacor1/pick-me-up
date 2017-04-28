class RidersController < ApplicationController

  def index
    binding.pry
    @riders = current_user.driver.riders
  end
end
