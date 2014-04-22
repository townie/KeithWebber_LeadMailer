# if Rails.env.development?
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings =  {
#     :address   => "smtp.mandrillapp.com",
#     :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
#     :enable_starttls_auto => true, # detects and uses STARTTLS
#     :user_name => "MANDRILL_USERNAME",
#     :password  => "MANDRILL_PASSWORD", # SMTP password is any valid API key
#     :authentication => 'plain', # Mandrill supports 'plain' or 'login'
#     :domain => 'leadmailer.herokuapp.com', # your domain to identify your server when connecting
#   }

# end
