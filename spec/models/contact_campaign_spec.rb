require 'spec_helper'

describe ContactCampaign do

  it { should belong_to(:campaign) }
  it { should belong_to(:contact) }

  it { should have_valid(:contact_id).when(1, 999) }
  it { should_not have_valid(:contact_id).when('', nil) }
  it { should have_valid(:contact_id).when(1, 999) }
  it { should_not have_valid(:contact_id).when('', nil) }

  it "should not allow you to add contacts to a campaign that has already been added" do
    contact_campaign = FactoryGirl.create(:ContactCampaign)
    contact          = Contact.first
    campaign         = Campaign.first

    dupe_cc = ContactCampaign.new(contact: contact, campaign: campaign)

    expect(dupe_cc.valid?).to be_false
  end
end
