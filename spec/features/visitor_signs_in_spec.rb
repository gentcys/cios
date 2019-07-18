require 'rails_helper'

RSpec.feature "Visitor Signs In", type: :feature do
  scenario "with valid email and password" do
    user = create(:user)
    sign_in_with(user.email, user.password)

    expect(page).to have_current_path(orders_path)
  end

  scenario 'with invalid email' do
    user = create(:user)
    sign_in_with(generate(:email), user.password)

    expect(page).to have_current_path(sign_in_path)
  end

  scenario 'with invalid password' do
    user = create(:user)
    sign_in_with(user.email, "password1")

    expect(page).to have_current_path(sign_in_path)
  end
end
