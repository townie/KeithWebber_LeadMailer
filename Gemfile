source 'https://rubygems.org'


  # Standard Library Gems
  ruby '2.0.0'
  gem 'rails', '4.1.0'
  gem 'pg'
  gem 'sass-rails', '~> 4.0.2'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails'
  gem 'jbuilder', '~> 1.2'
  gem 'font-awesome-sass'
  gem 'dotenv-rails'
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

  #sidekiq setup for mailing
  gem 'sidekiq'
  gem 'foreman'
  gem 'sinatra', require: false
  gem 'slim'
  gem 'unicorn'



  # Email related gems
  gem 'mail'
  gem 'mandrill-api'


  #gem 'mailcatcher' Only for reference
  #gem 'email_spec' <<<< test?S?S
  #gem "mailman" --< incoming mail

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
    #gem 'rack-mini-profiler'
    gem 'railroady'

    gem 'spring'
  end

gem "codeclimate-test-reporter", group: :test, require: nil

  group :test do
    gem 'launchy'
    gem 'capybara'
    gem 'minitest'
    gem 'shoulda-matchers'
    gem 'valid_attribute'
  end
