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

  scenario

  scenario 'Edit fields that correspond to the text fields in the emails' do
    visit campaign_path(@campaign1)

    click_on "Customize"

    fill_in "Title", with: "its a create day"
    fill_in "Field1", with: "Hello World"

    click_on "Create Material"

    expect(page).to have_content("Successfully created")

  end

  scenario 'Create a new email content section' do


  end



end
