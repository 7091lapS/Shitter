FactoryGirl.define do
  factory :user do

    password_fake = Faker::Internet.password(8)
    email { Faker::Internet.email }
    username { Faker::Internet.user_name(5)}
    password password_fake
    password_confirmation password_fake
  end
end
