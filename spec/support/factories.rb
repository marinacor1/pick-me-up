FactoryGirl.define do
  factory :driver do
    name Faker::Name.unique.name
    email Faker::Internet.email
    initial_location "Denver, CO"
    destination "Avon, CO"
    date Time.now.strftime("%m/%d/%y")
    time "Morning"
  end
end
FactoryGirl.define do
  factory :rider do
    name Faker::Name.unique.name
    email Faker::Internet.email
    initial_location "Denver, CO"
    destination "Avon, CO"
    date Time.now.strftime("%m/%d/%y")
    time "Morning"
  end
end
