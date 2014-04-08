require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do

  importer :gmail, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET_KEY"], {:redirect_path => "/contacts/gmail/callback", :ssl_ca_file => "/usr/local/share/ca-bundle.crt"}

  importer :hotmail, ENV["HOTMAIL_CLIENT_ID"], ENV["HOTMAIL_API_KEY"]
end
