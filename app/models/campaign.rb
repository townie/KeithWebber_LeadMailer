class Campaign < ActiveRecord::Base
  belongs_to :user

  validates :title,     presence: true
  validates :purpose,   presence: true
  validates :user_id,   presence: true
end
