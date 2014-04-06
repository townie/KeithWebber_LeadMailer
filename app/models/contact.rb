class Contact < ActiveRecord::Base
  belongs_to :user
  validates  :email,  presence: true,
                      uniqueness: { case_sensitive: false,
                                scope: :user_id,
                                message: "That email already exists" },
                      :email => {  message: "Please eneter a valid email" }

end
