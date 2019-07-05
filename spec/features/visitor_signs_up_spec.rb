require 'rails_helper'

RSpec.feature "Visitor signs up", type: :feature do
  scenario "with valid name, email and password" do
    visit sign_up_path
    fill_in "Name", with: "Michael Jordan"
    fill_in "Email", with: "valid@example.com"
    fill_in "Password", with: "password"
    click_button "Sign up"
  end
end
