require 'spec_helper'

feature 'User Signs In', %q{
  As a visitor
  I want to be able to sign up for an account with MINIMAL INFO
  so that I can start sending emails RIGHT AWAY to my contacts
} do

  # ----Acceptance Criteria----

  # *Sign up page with first, last name, email, company and phone number
  # *once that information is entered I will be promoted for more info
  # *Redirected to home page
  context "Regular Sign In" do
    scenario "Sign up page creates a new user" do
      prev_count = User.count
      user = FactoryGirl.build(:user)

      sign_up_as_regular(user)

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(User.count).to eq(prev_count + 1)
    end

    scenario "Requires valid info to sign up" do
      visit new_user_registration_path

      fill_in "First name",   with: "Keith"
      fill_in "Last name",    with: "Webber"
      fill_in "Company",      with: "WebCo"
      fill_in "Phone number", with: "6175553222"
      fill_in "Email",        with: ""
      fill_in "Password",     with: "password"

      click_on "Start For Free"

      expect(page).to have_content("can't be blank")
    end
  end

  context "User signs up with LinkedIn profile" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.on_failure = Proc.new { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }
  end

    scenario "Sign up page has link to sign in with LinkedIn" do
      OmniAuth.config.add_mock :linkedin, uid: "12345", :extra => {:raw_info => {firstName: "Keith", lastName: "Webber" }}

      prev_count = User.count

      visit new_user_registration_path

      expect(page).to have_content("Sign in with Linkedin")
      click_on "Sign in with Linkedin"

      expect(page).to have_content("Successfully authenticated from Linkedin account.")
      expect(User.count).to eq(prev_count + 1)
    end

  end
end
