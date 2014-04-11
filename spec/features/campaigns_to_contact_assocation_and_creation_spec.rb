require 'spec_helper'

feature 'Contacts get assigned to an email campaigns', %q{
  As a user who created a campaign,
  I want to be able to select contacts that I can send an email to,
  So that I have recipients of my amazing email.
} do
  # Acceptance Criteria-

  # After Creating a campaign I want to be able to add contacts to the campaign
  # see a page where I can associate contacts to campaign
  # after making my choices I want to be able to review the contacts I am sending emails to.
  before(:each) do
    @user       = FactoryGirl.create(:user)
    sign_in_as(@user)

    @campaign1   = FactoryGirl.create(:campaign, user: @user)
    @contact1    = FactoryGirl.create(:contact, user: @user)
    @contact2    = FactoryGirl.create(:contact, user: @user)
    @contact3    = FactoryGirl.create(:contact, user: @user)
  end

  scenario "After Creating a campaign I want to be able to add contacts to the campaign" do
    visit campaigns_path
    click_on "Add contacts"

    expect(page).to have_content("Select contacts to add to this campaign")
    check(@contact1.email)
    check(@contact2.email)
    check(@contact3.email)

    click_on "Add contact"

    expect(page).to have_content(@contact1.email)
    expect(page).to have_content(@contact2.email)
    expect(page).to have_content(@contact3.email)
  end

  scenario "User wants to be able to see what contacts where added to a campaign" do
    visit campaigns_path
    click_on "Add contacts"
    check(@contact1.email)
    click_on "Add contact"

    visit campaigns_path
    click_on "See results"
    expect(page).to have_content("Sell more stuff")
    expect(page).to have_content(@contact1.email)
  end

  scenario "User can not keep adding the same email to the email blast" do
    visit edit_campaign_path(@campaign1)
    check(@contact1.email)
    check(@contact2.email)
    click_on "Add contact"
    visit edit_campaign_path(@campaign1)
    uncheck(@contact1.email)
    click_on "Add contact"
    expect(page).to_not have_content(@contact1.email)
  end
end
