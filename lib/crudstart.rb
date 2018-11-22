require 'omniauth'
module OmniAuth
	module Strategies
		class Crudstart < OmniAuth::Strategies::OAuth2
			CUSTOM_PROVIDER_URL = 'http://localhost:3000'

      option :client_options, {
      	byebug
        :site =>  CUSTOM_PROVIDER_URL,
        :authorize_url => "#{CUSTOM_PROVIDER_URL}/api/auth/authorize",
        :access_token_url => "#{CUSTOM_PROVIDER_URL}/api/auth/access_token"
      }

			uid do
				raw_info["id"]
			end

			info do
				{email: raw_info["info"]["email"]}
			end

			def raw_info
        @raw_info ||= access_token.get("api/auth/customer.json?oauth_token=#{access_token.token}").parsed
			end
		end
	end
end