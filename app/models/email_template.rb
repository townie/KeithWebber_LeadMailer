class EmailTemplate < ActiveRecord::Base
  validates :title, presence: true
  validates :filename,  presence: true
end
