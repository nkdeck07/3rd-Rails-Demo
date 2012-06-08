FactoryGirl.define do
  factory :user do
    name     "Test2"
    email    "test2@test.com"
    password "password"
    password_confirmation "password"
  end
end