require 'spec_helper'

feature 'Manage Contacts', %q{
  As User who has uploaded contacts,
  I want to be able to see these contacts and edit them,
  So that I can fix any issues with contacts
} do

  #---- Acceptance Criteria -------

  # Show all contacts
  # Edit contacts
  # Delete contacts

  before(:each) do
    @user      = FactoryGirl.create(:user)
    sign_in_as(@user)

    visit new_users_contact_path
  end

  scenario "Show all contacts" do
    contact1 = FactoryGirl.create(:contact, user_id: @user.id)
    contact2 = FactoryGirl.create(:contact, user_id: @user.id)
    contact3 = FactoryGirl.create(:contact, user_id: @user.id)

    click_on "Contacts"

    expect(page).to have_content(contact1.email)
    expect(page).to have_content(contact2.email)
    expect(page).to have_content(contact3.email)
  end

  scenario "Edit Contacts" do
    contact1 = FactoryGirl.create(:contact, user_id: @user.id)
    updated_email = "new@email.com"
    visit users_contacts_path

    click_on contact1.email

    fill_in "Email", with: updated_email
    click_on "Edit contact"

    expect(page).to have_content("new@email.com was successfully updated.")
    expect(Contact.last.email).to eq(updated_email)
  end

  scenario "Delete a contact" do
    contact1 = FactoryGirl.create(:contact, user_id: @user.id)
    prev_count = Contact.count
    visit users_contacts_path

    click_on contact1.email

    click_on "Delete"

    expect(page).to have_content("Contact deleted")
    expect(Contact.last).to_not eq(contact1)
    expect(Contact.count).to eq(prev_count - 1)
  end
end

