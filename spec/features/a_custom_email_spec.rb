require 'spec_helper'

feature 'User Customizes Email', %q{
  As a User,
  I want to be able to customize the fields on the email template to reflect relevant information about my business,
  to better inform my contacts about the business.
} do
  # Acceptance Criteria

  # Edit fields that correspond to the text fields in the emails
  # Edit the colors
  # Edit the layout
  # SEE live preview for side by side email comparison
  # Submit a customized field form
  # Add Pictures to picture fields


  before(:each) do
    @user       = FactoryGirl.create(:user)
    sign_in_as(@user)

    @campaign1   = FactoryGirl.create(:campaign, user: @user)
    @contact1    = FactoryGirl.create(:contact, user: @user)

  end

  scenario 'Edit fields that correspond to the text fields in the emails' do
    visit campaign_path(@campaign1)

    click_on "Customize"

    fill_in "Title", with: "its a create day"
    fill_in "Field1", with: "Hello World"

    click_on "Create Material"

    expect(page).to have_content("Successfully created")

  end

  scenario "Display's multiple thumbnails of email templates" do
    template1 = FactoryGirl.create(:EmailTemplate)
    visit campaign_path(@campaign1)
    visit emailtemplates_path

    click_on 'Select Email template'
    click_on "Customize"

    expect(page).to have_content('Title')
    expect(page).to have_content('Field1')
  end

end
