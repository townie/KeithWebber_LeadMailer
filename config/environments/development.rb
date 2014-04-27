LeadMailer::Application.configure do
config.gem 'redis'
  OmniAuth.config.on_failure = Proc.new { |env| OmniAuth::FailureEndpoint.new(env).redirect_to_failure }

  config.action_mailer.perform_deliveries = true

  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # # Devise
  # config.action_mailer.default_url_options = { host: 'localhost:3000' }


  config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address   => "smtp.mandrillapp.com",
      :port      => 2525, # ports 587 and 2525 are also supported with STARTTLS
      :enable_starttls_auto => true, # detects and uses STARTTLS
      :user_name => ENV["MANDRILL_USERNAME"],
      :password  => ENV["MANDRILL_PASSWORD"], # SMTP password is any valid API key
      :authentication => 'login', # Mandrill supports 'plain' or 'login'
      :domain => 'leadmailer.herokuapp.com', # your domain to identify your server when connecting
    }

    # Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true

# Change mail delvery to either :smtp, :sendmail, :file, :test


# Specify what domain to use for mailer URLs
config.action_mailer.default_url_options = {host: "localhost:3000"}

end
