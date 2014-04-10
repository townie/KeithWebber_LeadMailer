require 'spec_helper'

feature 'User creates an email campaign', %q{
 As a user who has sent email campaigns,
  I want to be able to see the emails that I have sent out to better judge how things went
  in order to improve my understanding of how effective my email campaigns are.
} do
  # Acceptance Criteria

  # I want to be able to view past email marketing campaigns
  # See who was sent and email and what that contents was.
  # Later add analytics
  before(:each) do
    @user      = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  scenario "I want to be able to view past email marketing campaigns" do
    campaign1 = FactoryGirl.create(:campaign, user: @user)
    campaign2 = FactoryGirl.create(:campaign, user: @user)
    click_on "Log Out"

    user2      = FactoryGirl.create(:user)
    sign_in_as(user2)
    campaign3 = FactoryGirl.create(:campaign, title: "FAKE USER", purpose: "BAD", user: user2)
    click_on "Log Out"

    sign_in_as(@user)
    visit campaigns_path

    expect(page).to have_content(campaign1.title)
    expect(page).to have_content(campaign1.purpose)
    expect(page).to have_content(campaign2.title)
    expect(page).to have_content(campaign2.purpose)
    expect(page).to_not have_content(campaign3.title)
    expect(page).to_not have_content(campaign3.purpose)
  end

  scenario "I want to see who the email was sent to." do
    campaign1 = FactoryGirl.create(:campaign, user: @user)
    visit campaigns_path

    click_on "See results"

    expect(page).to have_content(campaign1.title)
    expect(page).to have_content(campaign1.purpose)

    expect(page).to have_content(campaign1.contacts.first)
    expect(page).to have_content(campaign1.contacts.last)
  end
end
