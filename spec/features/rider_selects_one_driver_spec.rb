require 'rails_helper'

RSpec.feature "rider selects one driver" do
  scenario "redirects to confirmation page" do
    rider = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver1 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver2 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver3 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")

    visit drivers_path

    check("#{driver1.name}")
    click_on "Confirm"

    expect(current_path).to eq(confirmation_path)
    expect(page).to have_content("Great. A request has been sent to #{driver1.name}. Check your email for next steps.")
  end
end
