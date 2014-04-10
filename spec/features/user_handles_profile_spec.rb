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

  scenario "User edit's profile" do
    click_on @user.first_name

    fill_in "First name",   with: @user.first_name
    fill_in "Last name",    with: "Crazy"
    fill_in "Company",      with: "WebCo"
    fill_in "Phone number", with: "6175553222"
    fill_in "Email",        with: @user.email

    click_on "Update"

    expect(page).to have_content("You updated your account successfully.")

    click_on @user.first_name

    expect(User.first.last_name).to have_content("Crazy")
    expect(User.first.company).to have_content("WebCo")
    expect(User.first.phone_number_primary).to have_content("6175553222")
  end

  scenario "User delete's their profile" do
    user_count = User.count
    click_on @user.first_name

    click_on "Cancel my account"

    expect(User.first).to be_nil
    expect(User.count).to eq(user_count - 1)

    #just to double check that the user was deleted
    visit new_user_session_path
    fill_in "Email",        with: @user.email
    fill_in "Password",     with: @user.password
    click_on "Sign in"

    expect(page).to have_content("Invalid email or password.")
  end
end
