FactoryGirl.define do
  factory :tweet do
    text Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/image/IMG_2257.JPG")
    user
  end
end
