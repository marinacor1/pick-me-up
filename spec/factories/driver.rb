FactoryGirl.define do
  factory :driver do
    name Faker::Name.name
    email Faker::Internet.email
    initial_location "Denver, CO"
    destination "Avon, CO"
    date Time.now.strftime("%m/%d/%y")
    time "Morning"
  end
end
