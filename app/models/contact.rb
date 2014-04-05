class Contact < ActiveRecord::Base
  belongs_to :user
  validates  :email, presence: true, uniqueness: { case_sensitive: false, message: "That email already exists" },  :email => {  message: "Please eneter a valid email" }

end
