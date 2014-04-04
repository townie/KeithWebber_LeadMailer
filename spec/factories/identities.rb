FactoryGirl.define do
  factory :identity do
    sequence(:user)       {|u| "#{u}"}
    provider              "linkedin"
    uid                   "12345"
    oauth_token           "abcdefghi"
    oauth_secret          "123456789"
    oauth_expires_at      "2014-04-03 12:04:44"
  end
end
