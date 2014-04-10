require 'spec_helper'

feature 'User creates an email campaign', %q{
  As a user,
  I want to be able to start a new marketing campaign,
  In order to reach more customers.
} do
  # Acceptance Criteria

  # Start new email campaign
  # Give it a name, a purpose, a genre ie ["marketing" "news letter" "infromative" "sale"]

  before(:each) do
    @user      = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario "Start new email campaign" do
    click_on "Campaigns"

    click_on "Create New Campaign"

    fill_in "Title", with: "Getting Started"
    fill_in "Purpose", with: "Testing the email campaign"
    select('Marketing', :from => 'Genre')

    click_on "Start campaign"

    expect(page).to have_content("")

  end

  scenario "it a name, a purpose, a genre ie ['marketing' 'news letter' 'infromative' 'sale']" do
   click_on "Campaigns"

    click_on "Create New Campaign"

    fill_in "Title", with: "Getting Started"
    fill_in "Purpose", with: "Testing the email campaign"
    select('Marketing', :from => 'Genre')

    click_on "Start campaign"

    expect(page).to have_content("")
  end

end
