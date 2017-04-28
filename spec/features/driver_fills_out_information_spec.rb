require 'rails_helper'

RSpec.feature "driver fills out information and sees riders" do
  scenario "entry form for driver" do
    rider = create(:rider, initial_location: "Denver, CO", destination: "Vail, CO", date: "June 6, 2017", time: "Morning")

    visit root_path
save_and_open_page
    click_on "Driver"
    select "Enter"

    expect(path).to eq(new_driver_path)

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
