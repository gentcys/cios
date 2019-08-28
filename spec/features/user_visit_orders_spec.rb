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

  scenario "with items summary" do
    orders = create_list(:order_with_items, 3)

    items_statistics = Hash.new{0}

    orders.each do |order|
      order.order_items.each do |order_item|
        items_statistics[order_item.item.name] += order_item.count
      end
    end

    user = create(:user)
    sign_in_with(user.email, user.password)
    visit orders_path

    expect(page).to have_content(items_statistics.keys.sample)
  end
end
