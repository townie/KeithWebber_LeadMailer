FactoryGirl.define do
  factory :contact do
    sequence(:email)     {|u| "test#{u}@example"}
    first_name           "John"
    last_name            "Doe"
    phone_number         "7812723400"
  end
end
