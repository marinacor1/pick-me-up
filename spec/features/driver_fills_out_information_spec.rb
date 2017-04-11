require 'rails_helper'

RSpec.feature "driver fills out information" do
  scenario "entry form for driver" do
    driver = create(:driver)
    rider = create(:rider)

    visit root_path

    click_on "Driver"
    fill_in "From", with: "Denver, CO"
    fill_in "Heading to", with: "Vail, CO"
    fill_in "Date", with: "June 6, 2017"
    fill_in "Time", with: "Morning"
    click_on "Submit"

    expect(current_path).to eq(riders_path)
    expect(page).to have_content "Riders"
    expect(page).to have_content rider.name
  end
end
