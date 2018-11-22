require File.expand_path('lib/crudstart', Rails.root)
CUSTOM_PROVIDER_URL = 'http://localhost:3000'
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :crudstart , ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end