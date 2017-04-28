require 'rails_helper'

RSpec.feature "driver can view all possible riders" do
  include FeaturesHelper
  scenario "riders index" do
    user = create(:user)
    driver = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider1 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider2 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider3 = create(:rider, initial_location: "Littleton, CO", destination: "Breckenridge, CO", date: "June 9, 2017", time: "Afternoon")
    rider4 = create(:rider, initial_location: "Colorado Springs, CO", destination: "Pueblo, CO", date: "June 9, 2017", time: "Afternoon")
    rider5 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 10, 2017", time: "Afternoon")
    rider6 = create(:rider, initial_location: "Vail, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Morning")

    login_setup

    visit new_driver_path

    fill_in "Name", with: driver.name
    fill_in "Email", with: driver.email
    fill_in "driver_initial_location", with:  driver.initial_location
    fill_in "Destination", with: driver.destination
    fill_in "driver_date", with: driver.date
    fill_in "driver_time", with: driver.time
    click_on "Submit"

    expect(page).to have_content rider1.name
    expect(page).to have_content rider2.name
    expect(page).to have_content rider3.name
    expect(page).to_not have_content rider4.name
    expect(page).to_not have_content rider5.name
    expect(page).to_not have_content rider6.name

end
end
