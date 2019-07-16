require 'rails_helper'

RSpec.feature "Visitor Signs In", type: :feature do
  scenario "with valid email and password" do
    user = create(:user)
    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "SIGNIN"

    expect(page).to have_current_path(orders_path)
  end

  scenario 'with invalid email' do
    user = create(:user)
    visit sign_in_path
    fill_in "Email", with: generate(:email)
    fill_in "Password", with: user.password
    click_button "SIGNIN"

    expect(page).to have_current_path(sign_in_path)
  end

  scenario 'with invalid password' do
    user = create(:user)
    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "SIGNIN"

    expect(page).to have_current_path(sign_in_path)
  end
end
