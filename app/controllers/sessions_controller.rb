class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		customer = Customer.find_by_provider_and_uid(auth["provider"],auth["uid"])
		session[:customer_id] = customer_id
		session[:access_token] = auth["credentials"]["token"]
		redirect_to root_url
	end

	def destroy
		session[:customer_id] = nil
		session[:access_token] = nil
		redirect_to root_url
	end
end
