FactoryGirl.define do
  factory :user do
    name     "Derek Chen"
    email    "tester002@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end