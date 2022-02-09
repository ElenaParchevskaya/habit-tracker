FactoryBot.define do
  factory :habit do
    title { "MyString" }
    description { "MyText" }

    trait :invalid do
      title { nil }
    end
  end
end
