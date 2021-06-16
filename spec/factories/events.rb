FactoryBot.define do
  factory :event do
    name { Faker::Lorem.characters(number: 5) }
    detail { Faker::Lorem.characters(number: 50) }
    remarks { Faker::Lorem.characters(number: 30) }
    start_time { Faker::Time.between(from: DateTime.current + 1, to: DateTime.current + 2) }
    end_time { Faker::Time.between(from: DateTime.current + 3, to: DateTime.current + 4) }
    place { Faker::Lorem.characters(number: 5) }
    release { false }
    user
  end
end

