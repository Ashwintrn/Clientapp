require File.expand_path('lib/omniauth/strategies/Crudstart', Rails.root)
CUSTOM_PROVIDER_URL = 'http://localhost:3000'
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :Crudstart , ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end