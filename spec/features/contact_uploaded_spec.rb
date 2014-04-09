require 'spec_helper'

feature 'Upload Contacts', %q{
  As a User who has contacts,
  I want to be able to upload the contacts to database,
  so that I may view all of the contacts
} do

  #---- Acceptance Criteria -------

  # *Upload email by entering email with other fields optional into a field
  # *from email, linkedin, facebook'



  before(:each) do
    user      = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit new_users_contact_path
  end

  scenario "A user can upload a new contact" do
    fill_in "Email", with: "test@stuff.com"
    click_on "Add new contact"

    expect(page).to have_content("test@stuff.com added")
  end

  scenario "A user is prompted for correct email when fails" do
    fill_in "Email", with: "test@stu"
    click_on "Add new contact"

    expect(page).to have_content("Please eneter a valid email")
  end

  scenario "Contact uploaded and a user can see their contacts" do
    fill_in "Email", with: "test@stuff.com"
    click_on "Add new contact"

    visit users_contacts_path

    expect(page).to have_content("test@stuff.com")
  end

  scenario "A user can access their 3rd party email services to get their contacts" do
    OmniContacts.integration_test.enabled = true
    OmniContacts.integration_test.mock(:gmail, :email => "user@example.com")

    visit new_users_contact_path

    click_on "Import contacts from Gmail"

    page.should have_content("user@example.com")

  end


end


