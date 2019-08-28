FactoryBot.define do
  sequence :name do |n|
    "name #{n}"
  end

  sequence :count do |n|
    Random.rand(1...10)
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name
    email
    password { "password" }
  end

  factory :restaurant do |n|
    name
    sequence(:address) { |n| "#{n} street" }
  end

  factory :menu do |n|
    name
    restaurant
  end

  factory :item do |n|
    name
    menu
  end

  factory :order do |n|
    user

    # order_with_items will create one's item data after the order has been created
    factory :order_with_items do
      transient do
        items_count { 2 }
      end

      after(:create) do |order, evaluator|
        create_list(:order_item, evaluator.items_count, order: order)
      end
    end
  end

  factory :order_item do |n|
    order
    item
    count
  end
end
