class DriversController < ApplicationController
  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create(driver_params)
    if @driver.save
      redirect_to riders_path
    else
      render :new
    end
  end

  # def show
  #   @driver = Driver.find(params[:id])
  # end

  private

  def driver_params
    params.require(:driver).permit(:name, :email, :initial_location, :destination, :date, :time)
  end
end
