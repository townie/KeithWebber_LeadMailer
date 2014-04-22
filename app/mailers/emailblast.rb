class Emailblast < ActionMailer::Base
  # sendgrid_category :use_subject_lines
  # sendgrid_enable   :ganalytics, :opentrack

  default from: "from@leadmailer.herokuapp.com"

  def email1(material, contact)
    @contact = contact
    @material = material

    mail(to: @contact.email, subject: 'Welcome to My Awesome Site')
  end

end
