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
  end

  factory :order_item do |n|
    order
    item
    count
  end
end
