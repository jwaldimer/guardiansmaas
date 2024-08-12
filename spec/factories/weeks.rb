FactoryBot.define do
  factory :week, class: 'Week' do
    number { Faker::Number.between(from: 1, to: 52) }
    year { Faker::Number.between(from: 2024, to: 2025) }
    created_at { "2024-08-08 06:21:14 UTC" }
    updated_at { "2024-08-08 06:25:14 UTC" }
  end
end
