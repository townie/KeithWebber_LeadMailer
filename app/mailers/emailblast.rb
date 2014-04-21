class Emailblast < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack

  default from: "from@example.com"

  def email1(material, contact)
    @contact = contact
    @material = material

    mail(to: @contact.email, subject: 'Welcome to My Awesome Site')
  end

end
