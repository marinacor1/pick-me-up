require 'rails_helper'

RSpec.feature "rider fills out information and sees drivers" do
  include FeaturesHelper
  scenario "entry form for rider" do
    user = create(:user)
    driver = create(:driver, initial_location: "Denver, CO", destination: "Vail, CO", date: "June 6, 2017", time: "Morning")

    login_setup

    check "onoffswitch"
    click_on "Enter"

    expect(current_path).to eq(new_rider_path)

    fill_in "Name", with: driver.name
    fill_in "Email", with: driver.email
    fill_in "rider_initial_location", with: "Denver, CO"
    fill_in "Destination", with: "Vail, CO"
    fill_in "rider_date", with: "June 6, 2017"
    fill_in "rider_time", with: "Morning"
    click_on "Submit"

    expect(current_path).to eq(riders_path)
    expect(page).to have_content Rider.last.initial_location
    expect(page).to have_content Rider.last.destination
    expect(page).to have_content Rider.last.time

    expect(page).to have_content "Drivers"
    expect(page).to have_content driver.name
  end
end
