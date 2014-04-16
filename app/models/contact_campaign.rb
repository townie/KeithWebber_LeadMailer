class ContactCampaign < ActiveRecord::Base
  belongs_to :contact
  belongs_to :campaign

  validates :contact_id,   presence: true, uniqueness: {scope: :campaign_id}
  validates :campaign_id,   presence: true, uniqueness: {scope: :contact_id}
end
