FactoryBot.define do
  sequence :name do |n|
    "name #{n}"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name
    email
    password { "password" }
  end
end
