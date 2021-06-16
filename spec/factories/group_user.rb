FactoryBot.define do
  factory :group_user do
    group_id { Faker::Number.number(5) }
    user_id { Faker::Number.number(5) }
  end
end