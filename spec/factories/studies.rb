FactoryBot.define do
  factory :study do
    content { Faker::Lorem.paragraphs }
    reason { Faker::Lorem.paragraphs }
    price { Faker::Lorem.word }
    url { Faker::Lorem.characters }
    # method { Faker::Lorem.word }

    after(:build) do |study|
      study.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end
