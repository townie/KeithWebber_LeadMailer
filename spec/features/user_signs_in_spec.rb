require 'spec_helper'

feature 'User Signs In', %q{
As a professional user,
I want to be able to sign in and sign up with my LinkedIn account or regularly
So that I can have access to all the ease of using my linkedIn account.

Acceptance Criteria

} do

  # ----Acceptance Criteria----

  # *Click on sign in with Linkedin and automatically creates a profile based on linkedin data
  # *Already have a user profile, click through to associate this info with account

  context "Regular Sign In" do

    scenario "Sign in with email password" do
      user      = FactoryGirl.create(:user)
      log_count = user.sign_in_count
      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign in'

      user = User.last

      expect(page).to have_content("Keith")
      expect(user.sign_in_count).to eq(log_count + 1)
    end

    scenario "Requires valid info to sign in" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in "Email",        with: ""
      fill_in "Password",     with: "password"

      click_on "Sign in"

      expect(page).to have_content("Invalid email or password.")
    end
  end

  context "User signs in with LinkedIn profile" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.on_failure = Proc.new { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }
  end

    scenario "Sign in page has link to sign in with LinkedIn" do
      OmniAuth.config.add_mock :linkedin, uid: "12345", :extra => {:raw_info => {firstName: "Keith", lastName: "Webber" }}

      prev_count = User.count

      visit new_user_session_path

      expect(page).to have_content("Sign in with LinkedIn")
      click_on "Sign in with LinkedIn"


      expect(page).to have_content("Successfully authenticated from Linkedin account.")
      expect(User.count).to eq(prev_count + 1)
    end

  end
end
