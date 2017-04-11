require 'rails_helper'

RSpec.feature "driver can view all possible riders" do
  scenario "riders index" do
    driver = create(:driver, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider1 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider2 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider3 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Afternoon")
    rider4 = create(:rider, initial_location: "Littleton, CO", destination: "Pueblo, CO", date: "June 9, 2017", time: "Afternoon")
    rider5 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 10, 2017", time: "Afternoon")
    rider6 = create(:rider, initial_location: "Littleton, CO", destination: "Avon, CO", date: "June 9, 2017", time: "Morning")

    visit riders_path

    expect(page).to have_content { rider1.name, rider2.name, rider3.name }
    expect(page).to not_have_content { rider4.name, rider5.name, rider6.name }

end
end
