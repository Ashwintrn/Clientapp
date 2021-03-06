require 'omniauth'
module OmniAuth
	module Strategies
		class Crudstart < OmniAuth::Strategies::OAuth2
			option :name, :Crudstart

			option :client_options, {
				site: "http//localhost:3000",
				authorize_path: "/oauth/authorize"
			}

			uid do
				raw_info["id"]
			end

			info do
				{name: raw_info["name"]}
			end

			def raw_info
				@raw_info ||= access.token.get('/api/customer').parsed
			end
		end
	end
end