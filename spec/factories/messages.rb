FactoryBot.define do
  factory :message do
    message {Faker::Lorem.characters(number: 100)}
    association :user
    association :room
    association :admin
  end
end
