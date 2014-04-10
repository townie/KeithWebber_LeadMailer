require 'spec_helper'

feature 'User creates an email campaign', %q{
  As a user,
  I want to be able to start a new marketing campaign,
  In order to reach more customers.
} do
  # Acceptance Criteria

  # Start new email campaign
  # Give it a name, a purpose => 'Marketing', "Newsletter", "Press Release", "Survey", "Invitation", "Thank you"

  before(:each) do
    @user      = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario "Start new email campaign" do
    camp_count = Campaign.count
    click_on "Campaigns"

    click_on "Create New Campaign"

    fill_in "Title", with: "Getting Started"
    fill_in "Purpose", with: "Testing the email campaign"

    click_on "Start campaign"

    expect(page).to have_content("Create ")
    expect(Campaign.count).to eq(camp_count + 1)
  end

  scenario "it a name, a purpose if not valid prompts for correct info" do
    camp_count = Campaign.count
    click_on "Campaigns"

    click_on "Create New Campaign"

    fill_in "Title", with: ""
    fill_in "Purpose", with: "Testing the email campaign"


    click_on "Start campaign"

    expect(page).to have_content("can't be blank")
    expect(Campaign.count).to eq(camp_count)
  end

end
