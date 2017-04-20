require 'rails_helper'

RSpec.feature "rider can view all possible drivers" do
  scenario "drivers index" do
    rider = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver1 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver2 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver3 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    driver4 = create(:driver, initial_location: "Littleton, CO", destination: "Pueblo, CO", date: "June 9, 2017", time: "Afternoon")
    driver5 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 10, 2017", time: "Afternoon")
    driver6 = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Morning")

    visit drivers_path

    expect(page).to have_content(driver1.name)
    expect(page).to have_content driver2.name
    expect(page).to have_content driver3.name
    expect(page).to not_have_content driver4.name
    expect(page).to not_have_content driver5.name
    expect(page).to not_have_content driver6.name

end
end
