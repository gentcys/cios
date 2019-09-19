require 'rails_helper'

RSpec.feature "user visit orders", type: :feature do
  scenario "after signed in" do
    order_item = create(:order_item)

    user = create(:user)
    sign_in_with(user.email, user.password)
    visit orders_path

    expect(page).to have_current_path(orders_path)
    expect(page).to have_content(order_item.order.id)
  end

  scenario "before signed in" do
    visit orders_path

    expect(page).to have_current_path(sign_in_path)
  end
end
