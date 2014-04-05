require 'spec_helper'

feature 'Upload Contacts', %q{
  As a User who has contacts,
  I want to be able to upload the contacts to database,
  so that I may view all of the contacts
} do

  #---- Acceptance Criteria -------

  # *Upload email by entering email with other fields optional into a field
  # *Upload excel spreadsheet
  # *from email, linkedin, facebook'
  # *Upload a CSV


  before(:each) do
    user      = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit new_contact_path
  end

  scenario "A user can upload a new contact" do
    fill_in "Email", with: "test@stuff.com"
    click_on "Add new contact"

    expect(page).to have_content("test@stuff.com added")
  end

  scenario "Contact uploaded and a user can see their contacts" do
    fill_in "Email", with: "test@stuff.com"
    click_on "Add new contact"

    visit contacts_path

    expect(page).to have_content("test@stuff.com")

  end


end


