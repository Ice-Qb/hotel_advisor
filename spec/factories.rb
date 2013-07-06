FactoryGirl.define do
  factory :user do
    name     "Kyle Butler"
    email    "kyle@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end