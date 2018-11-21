require File.expand_path('lib/sso', Rails.root)
CUSTOM_PROVIDER_URL = 'http://localhost:3000'
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :sso , ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end