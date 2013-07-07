FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :hotel do
    title "Some title"
    breakfast true
    description "Very nice hotel"
    price 30.0
    user
  end

  factory :address do
    nation "Some country"
    state  "Some state"
    city   "Some city"
    street "Some street"
    hotel
  end

  factory :rating do
    value 2.57
    comment "Doh eee..."
    hotel
  end
end

