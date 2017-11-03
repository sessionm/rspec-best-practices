FactoryGirl.define do
  factory :star do
    slug { Faker::Internet.slug }
    mass { Faker::Number.decimal(4,3) }
    formal_name { Faker::Name.name }
  end
end
