# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'valid_attribute'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.include SignInHelper

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"


 OmniAuth.config.test_mode = true
  # ------ NEED TO REFACTOR ------
  # config.include OmniauthHelper
  # OmniAuth.config.mock_auth[:linkedin] = mock_auth_linkedin

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


end


