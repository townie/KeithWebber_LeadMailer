class ContactCampaign < ActiveRecord::Base
  belongs_to :contact
  belongs_to :campaign

  validates :contact_id,   presence: true
  validates :campaign_id,   presence: true
end
