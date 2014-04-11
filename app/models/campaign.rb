class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :contact_campaigns
  has_many :contacts, through: :contact_campaigns

  validates :title,     presence: true
  validates :purpose,   presence: true
  validates :user_id,   presence: true
end
