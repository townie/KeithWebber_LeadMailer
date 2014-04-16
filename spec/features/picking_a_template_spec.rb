require 'spec_helper'

feature "User selects an email template", %q{
  As a User,
  I want to be able to see a selection of email templates,
  so that I can fill it out and send it to my contacts.
} do
# Acceptance Criteria

# Display multiple thumbnails of email templates
# Select email template and move into editing it
# can see all the templates and select one to create a campaign around

  before(:each) do
    @user        = FactoryGirl.create(:user)
    @campaign1   = FactoryGirl.create(:campaign, user: @user)
    @contact1    = FactoryGirl.create(:contact, user: @user)
    sign_in_as(@user)
  end

  scenario "Display's multiple thumbnails of email templates" do
    template1 = FactoryGirl.create(:EmailTemplate)

    visit campaign_path(@campaign1)

    click_on "Select Email template"

    expect(page).to have_content(template1.title)
  end

  scenario "Selected template and start editing it" do
    template1 = FactoryGirl.create(:EmailTemplate)
    visit campaign_path(@campaign1)

    click_on "Select Email template"

    click_on "Select Email template"

  # expect(page).to have_content("Customize")
  end

  scenario "See all templates" do
    template1 = FactoryGirl.create(:EmailTemplate)
    visit emailtemplates_path

    expect(page).to have_content(template1.title)

  end

  scenario "An email is assocated with a campaign" do
    template1 = FactoryGirl.create(:EmailTemplate)
    visit campaign_path(@campaign1)

    select(template1.title, from: "Email template")
    click_on "Update Campaign"

    expect(Campaign.last.email_template).to eq(template1)
  end
end
