class RidersController < ApplicationController

  def index
    @riders = current_user.driver.riders
  end
end
