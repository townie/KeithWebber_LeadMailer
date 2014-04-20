source 'https://rubygems.org'

  # Standard Library Gems
  gem 'rails', '4.1.0'
  gem 'pg'
  gem 'sass-rails', '~> 4.0.2'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails'
  gem 'turbolinks'
  gem 'jbuilder', '~> 1.2'

  group :production do
    gem 'rails_12factor'
  end

  # Front end UI gems
  gem 'simple_form'
  gem 'foundation-rails'
  gem 'formtastic'

  # Authentication
  gem 'devise'
  gem 'cancancan'
  gem 'omniauth'
  gem 'omniauth-linkedin'

  # Getting Contacts from 3rd party services
  gem "omnicontacts"

  # User input validation gems for phone and email
  gem 'email_validator'
  gem 'phonelib'

  # Email related gems
  gem 'mail'
  # need to add?!??!
  #gem 'sidekiq_mailer'

  #gem 'mailcatcher' ---< DONT ADD
  #gem 'email_spec' <<<< test?S?S
  # gem "mailman" --< incoming mail

  group :doc do
    gem 'sdoc', require: false
  end

  group :development do
    gem 'quiet_assets'
  end

  group :test, :development do
    gem 'rspec-rails'
    gem 'pry'
    gem 'factory_girl_rails'

    gem 'railroady'
    gem 'dotenv-rails'
    gem 'spring'
  end

  group :test do
    gem 'launchy'
    gem 'capybara'
    gem 'minitest'
    gem 'shoulda-matchers'
    gem 'valid_attribute'
  end
