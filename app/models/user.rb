class User < ActiveRecord::Base
  has_many :identities,
           dependent: :destroy

  TEMP_EMAIL = 'change@me.com'
  TEMP_EMAIL_REGEX = /change@me.com/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,    :registerable,
         :recoverable,                 :rememberable,
         :trackable,                   :validatable,
         :omniauthable,                :omniauth_providers => [:linkedin]

  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :company,               presence: true
  validates :email,                 presence: true,  email: true
  validates :phone_number_primary,  presence: true,
                                    phone: { possible: true,
                                             types: [:voip,    :personal_number,
                                                     :mobile,  :fixed_line,
                                                     :fixed_or_mobile]
                                            }

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    user = identity.user
    if user.nil?

      # Get the existing user from email if the OAuth provider gives us an email
      user = User.where(:email => auth.info.email).first if auth.info.email

      # Create the user if it is a new registration
      if user.nil?
        user = User.new(
          first_name: auth.extra.raw_info.firstName,
          last_name: auth.extra.raw_info.lastName,
          #username: auth.info.nickname || auth.uid,
          company: "NEEDUPDATING12345",
          phone_number_primary: "6172417440",
          email: auth.info.email.blank? ? TEMP_EMAIL : auth.info.email,
          password: Devise.friendly_token[0,20]
        )

        user.save!
      end

      # Associate the identity with the user if not already
      if identity.user != user
        identity.user = user
        identity.save!
      end
    end
    user
  end


end
