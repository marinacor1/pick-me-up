require 'rails_helper'

RSpec.feature "rider fills out information and sees drivers" do
  scenario "entry form for rider" do
    driver = create(:driver, initial_location: "Denver, CO", destination: "Vail, CO", date: "June 6, 2017", time: "Morning")

    visit root_path

    click_on "Rider"
    fill_in "From", with: "Denver, CO"
    fill_in "Heading to", with: "Vail, CO"
    fill_in "Date", with: "June 6, 2017"
    fill_in "Time", with: "Morning"
    click_on "Submit"

    expect(current_path).to eq(riders_path)
    expect(page).to have_content "Drivers"
    expect(page).to have_content driver.name
  end
end
