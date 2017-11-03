FactoryGirl.define do
  factory :solar_system do
    slug { Faker::Internet.slug }
    formal_name { Faker::Name.name }
  end
end
