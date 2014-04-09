require 'spec_helper'

feature 'User profile', %q{
  As a User,
  I want to be able to log Out, Edit and Delete my profile
  so that I may change my service.
} do

  # ----Acceptance Criteria----
  # logs Out
  # Edit
  # Delete Profile

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario "User logs out" do
    click_on "Log Out"

    expect(page).to have_content("Signed out successfully.")

    expect(page).to have_content("Log In")

  end
end
