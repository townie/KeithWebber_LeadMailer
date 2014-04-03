
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

FactoryGirl.define do
  factory :identity do
    sequence(:user)       {|u| "keith#{u}"}
    provider              "linked_in"
    uid                   "12345"
    oauth_token           "abcdefghi"
    oauth_secret          "123456789"
    oauth_expires_at      "2014-04-03 12:04:44"
  end
end
