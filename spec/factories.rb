FactoryGirl.define do 
  factory :album do
    id 1
    name "OK Computer"
    img_url "OKComputer.com"
  end

  factory :artist do
    id 1
    name Faker::Name.name
    url "radiohead.com"
  end

  factory :user do
    id 1
    name Faker::Name.name
    email 'mike@sample.com'
    password 'password'
  end
  factory :song do
    id 1
    name Faker::Name.name
    artist
    album


  end
end