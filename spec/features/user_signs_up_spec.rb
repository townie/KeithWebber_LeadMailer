require 'spec_helper'

feature 'User Signs Up', %q{
  As a visitor
  I want to be able to sign up for an account with MINIMAL INFO
  so that I can start sending emails RIGHT AWAY to my contacts
} do

  # ----Acceptance Criteria----

  # *Sign up page with first, last name, email, company and phone number
  # *once that information is entered I will be promoted for more info
  # *Redirected to home page

  scenario "Sign up page creates a new user" do
    visit new_user_registration_path

    fill_in "First name",   with: "Keith"
    fill_in "Last name",    with: "Webber"
    fill_in "Company",      with: "WebCo"
    fill_in "Phone number", with: "6175553222"
    fill_in "Email",        with: "webber@gmail.com"
    fill_in "Password",     with: "password"

    click_on "Start For Free"

    expect(page).to have_content("Welcome! You have signed up successfully.")
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
