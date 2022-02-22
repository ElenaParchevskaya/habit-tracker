FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  trait :with_habit do
    after :create do |user|
      create :habit, author: user
    end
  end
end
