FactoryGirl.define do
  factory :driver do
    name Faker::Name.unique.name
    email Faker::Internet.email
    initial_location ["Denver, CO", "Littleton, CO", "Colorado Springs, CO"]
    destination []"Avon, CO", "Vail, CO", "Winter Park, CO"]
    date Time.now.strftime("%m/%d/%y")
    time ["Morning", "Afternoon", "Evening"][rand(0..2)]
  end
end
