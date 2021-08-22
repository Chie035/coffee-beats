FactoryBot.define do
  factory :post_article do
    body { Faker::Lorem.characters(number:20) }
    user
  end
end