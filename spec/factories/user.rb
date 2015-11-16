FactoryGirl.define do
  factory :user do
    email "user@test.com"
    password "testtest"
    password_confirmation "testtest"
  end
end
