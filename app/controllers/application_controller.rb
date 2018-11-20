class ApplicationController < ActionController::Base
	protect_from_forgery

	rescue_from OAuth2::Error do |exception|
		if exception.response.status == 401
			session[:customer_id] = nil
			session[:access_token] = nil
			redirect_to root_url, alert: "Token problem"
		end
	end

private
	def oauth_client
		byebug
		@oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: "http://localhost:3000")
	end

	def access_token
		byebug
		if session[:access_token]
			@access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
		end
	end

	# def current_customer
	# 	current_customer ||= Customer.find(session[:customer_id])if session[:customer_id]
	# end
	#helper method :current_customer
end
