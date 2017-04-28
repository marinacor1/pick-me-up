class RidersController < ApplicationController

  def index
    @riders = current_user.riders
  end
end
