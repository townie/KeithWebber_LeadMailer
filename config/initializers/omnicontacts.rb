require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_API_KEY"], {:redirect_path => "/contacts/gmail/callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
  #importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  importer :hotmail, ENV["HOTMAIL_CLIENT_ID"], ENV["HOTMAIL_API_KEY"]
end
