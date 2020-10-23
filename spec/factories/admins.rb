FactoryBot.define do
  factory :admin do
    name                   {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 8)}
    password_confirmation  {password}
  end
end
