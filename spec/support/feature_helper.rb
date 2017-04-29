module FeaturesHelper

  def login_setup
    visit login_path
    fill_in "Username", with: "randomuser"
    fill_in "Password", with: "abcdefgh"
    click_button "Login"
  end

  def driver_form(driver)
    fill_in "Name", with: driver.name
    fill_in "Email", with: driver.email
    fill_in "driver_initial_location", with:  driver.initial_location
    fill_in "Destination", with: driver.destination
    fill_in "driver_date", with: driver.date
    fill_in "driver_time", with: driver.time
  end

end
