class OrdersController < ApplicationController
	before_action :login_required
	def index
		# @orders = access_token.get("/api/orders").parsed if access_token
		# respond_to do |format|
		# 	format.json { render json: @orders}
		# end
	end

	def create
		#access_token.post("/api/orders", params: {order: {id: params[:id]}})
	end
end
