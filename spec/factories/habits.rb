FactoryBot.define do
  factory :habit do
    title { "MyTitle" }
    description { "MyText" }
    association :author, factory: :user

    trait :invalid do
      title { nil }
    end
  end
end
