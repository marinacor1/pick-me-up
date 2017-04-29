require 'rails_helper'

RSpec.feature "driver selects one rider" do
  include FeaturesHelper
  scenario "redirects to confirmation page" do
    user = create(:user)
    driver = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider1 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider2 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider3 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")

    login_setup
    click_on "Enter"

    driver_form(driver)
    click_on "Submit"

    check("#{rider1.name}")
    click_on "Confirm"

    expect(current_path).to eq(confirmation_path)
    expect(page).to have_content("Great. A request has been sent to #{rider1.name}. Check your email for next steps.")
  end
end
