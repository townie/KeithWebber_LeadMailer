class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contact_campaigns
  has_many :campaigns, through: :contact_campaigns

  validates  :email,  presence: true,
                      uniqueness: { case_sensitive: false,
                                scope: :user_id,
                                message: "That email already exists" },
                      :email => {  message: "Please eneter a valid email" }

  def self.gmail_email_catcher(response, current_user)
    new_contact = []
    info_required_contact = []
    response.each do |lead|
      potential_contact = Contact.new
      potential_contact.user_id = current_user.id
      potential_contact.first_name = lead[:first_name]
      potential_contact.last_name = lead[:last_name]
      potential_contact.email = lead[:email]
      potential_contact.note = "Gmail Import"
      if potential_contact.save
        new_contact << potential_contact
      else
        info_required_contact << potential_contact
      end
    end
   new_contact
  end
end
