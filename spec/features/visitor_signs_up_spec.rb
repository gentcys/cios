require 'rails_helper'

RSpec.feature "Visitor signs up", type: :feature do
  scenario "with valid name, email and password" do
    sign_up_with("Michael Jordan", "valid@example.com", "password")

    expect(page).to have_current_path(root_path)
  end

  scenario "with invalid name" do
    sign_up_with("a" * 51, "valid@example.com", "password")

    expect(page).to have_current_path(sign_up_path)
  end

  scenario "with invalid email" do
    sign_up_with("Michael", "x.y.zdexample,xyz", "password")

    expect(page).to have_current_path(sign_up_path)
  end

  scenario "with invalid password and confirmation" do
    sign_up_with("Michael", "x.y.z@example.syc", "a" * 5)

    expect(page).to have_current_path(sign_up_path)
  end
end
