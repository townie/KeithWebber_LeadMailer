class EmailTemplate < ActiveRecord::Base
  has_many :campaigns

  validates :title, presence: true
  validates :filename,  presence: true
end
