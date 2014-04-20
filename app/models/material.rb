class Material < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :email_template
  validates :title, presence: true
end
