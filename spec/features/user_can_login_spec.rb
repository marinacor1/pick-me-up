require 'rails_helper'

RSpec.describe "user can login" do
  include FeaturesHelper
  scenario "user can login to account" do
    user = create(:user)

    login_setup

    expect(current_path).to eq(root_path)
  end
end
