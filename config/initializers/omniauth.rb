require File.expand_path('lib/omniauth/strategies/Crudstart', Rails.root)
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :Crudstart , ENV["OAUTH_ID"], ENV["OAUTH_SECRET"]
end