FactoryGirl.define do
  factory :user do
    first_name            "Keith"
    last_name             "Webber"
    company               "WebCo"
    phone_number_primary  "6175555555"
    sequence(:email)      { |n| "keith#{n}@gmail.com" }
    password              "password"
  end
end
