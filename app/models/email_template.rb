class EmailTemplate < ActiveRecord::Base
  has_many :campaigns
  has_many :materials

  validates :title, presence: true
  validates :filename,  presence: true
end
