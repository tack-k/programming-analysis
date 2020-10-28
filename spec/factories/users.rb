FactoryBot.define do
  factory :user do
    username               {Faker::Name.initials}
    email                  {Faker::Internet.free_email}
    result_id              {Faker::Number.between(from: 1, to: 5)}
    password               {'15d3fgjk'}
    password_confirmation  {password}
  end
end
