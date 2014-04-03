class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number_primary, presence: true, phone: {possible: true,  types: [:voip, :mobile, :voip, :personal_number, :fixed_line, :fixed_or_mobile]}
  validates :company, presence: true
  validates :email, presence: true, email: true
end
