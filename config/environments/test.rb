LeadMailer::Application.configure do

  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.default_url_options = { :host => config.app_domain }
  # config.action_mailer.smtp_settings = {
  #   address: 'smtp.gmail.com',
  #   port: '587',
  #   enable_starttls_auto: true,
  #   user_name: '',
  #   password: '',
  #   authentication => :plain,
  #   domain => 'somedomain.com'
  # }

  OmniAuth.config.test_mode = true

   OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new(
      {"provider"=>"linkedin",
      "uid"=>"BuXMvzpm3r",
      "info"=>
      {"name"=>"Keith Webber",
      "email"=>"keith.e.webber@gmail.com",
      "nickname"=>"Keith Webber",
      "first_name"=>"Keith",
      "last_name"=>"Webber",
      "location"=>"Greater Boston Area, US",
      "description"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
      "image"=>
      "http://m.c.lnkd.licdn.com/mpr/mprx/0_gnYAT9AKUUXtg_nV1rpmTv9tJj_GlhFVxlEmTvn86OB-mkrsAKmjfzGmcvij-F69yvyfm-kBPueC",
      "phone"=>nil,
      "headline"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
      "industry"=>"Computer Software",
      "urls"=>{"public_profile"=>"http://www.linkedin.com/in/webberkeith"}},

      "raw_info"=>
      {"emailAddress"=>"keith.e.webber@gmail.com",
      "firstName"=>"Keith",
      "headline"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
      "id"=>"BuXMvzpm3r",
      "industry"=>"Computer Software",
      "lastName"=>"Webber",
      "location"=>{"country"=>{"code"=>"us"}, "name"=>"Greater Boston Area"},
      "pictureUrl"=>
      "http://m.c.lnkd.licdn.com/mpr/mprx/0_gnYAT9AKUUXtg_nV1rpmTv9tJj_GlhFVxlEmTvn86OB-mkrsAKmjfzGmcvij-F69yvyfm-kBPueC",
      "publicProfileUrl"=>"http://www.linkedin.com/in/webberkeith"}}
      )




  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=3600"

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr
end
