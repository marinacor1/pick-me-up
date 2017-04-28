require 'rails_helper'

RSpec.describe "user can login" do
  include FeaturesHelper
  scenario "user can login to account" do
    user = User.create(username: "randomuser", password: "abcdefgh", password_confirmation: "abcdefgh")

    login_setup

    expect(current_path).to eq(root_path)
  end
end
