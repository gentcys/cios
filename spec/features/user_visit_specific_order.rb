require 'rails_helper'

RSpec.feature "user visit specific order", type: :feature do
  let(:order) { create(:order) }
  let(:user) { create(:user) }

  scenario 'before signed in' do
    visit order_path(order)

    expect(page).to have_current_path(sign_in_path)
  end

  scenario 'not exists' do
    order.destroy

    sign_in_with(user.email, user.password)

    visit order_path(order)

    expect(page).to have_current_path(orders_path)
  end

  scenario 'successfully' do
    sign_in_with(user.email, user.password)

    visit order_path(order)

    expect(page).to have_current_path(order_path(order))
  end
end
