require 'rails_helper'

RSpec.feature "driver fills out information and sees riders" do
  include FeaturesHelper
  scenario "entry form for driver" do
    user = create(:user)
    rider = create(:rider, initial_location: "Denver, CO", destination: "Vail, CO", date: "June 6, 2017", time: "Morning")

    login_setup
    check "onoffswitch"
    click_on "Enter"

    expect(current_path).to eq(new_driver_path)
    fill_in "Name", with: rider.name
    fill_in "Email", with: rider.email
    fill_in "driver_initial_location", with: "Denver, CO"
    fill_in "Destination", with: "Vail, CO"
    fill_in "driver_date", with: "June 6, 2017"
    fill_in "driver_time", with: "Morning"
    click_on "Submit"

    expect(current_path).to eq(riders_path)

    expect(page).to have_content Driver.last.initial_location
    expect(page).to have_content Driver.last.destination
    expect(page).to have_content Driver.last.time

    expect(page).to have_content "Riders"
    expect(page).to have_content rider.name
  end
end
