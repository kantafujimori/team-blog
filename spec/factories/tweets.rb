FactoryGirl.define do
  factory :tweet do
    text Faker::Lorem.sentence
    image File.open("#{Rails.root}/app/images/IMG_2257.JPG")
    user
  end
end
