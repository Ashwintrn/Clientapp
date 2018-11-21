class CustomerSessionsController < ApplicationController
  before_action :login_required, only: [ :destroy ]

  # omniauth callback method
  #
  # First the callback operation is done
  # inside OmniAuth and then this route is called
  def create
    omniauth = env['omniauth.auth']
    logger.debug "+++ #{omniauth}"

    customer = Customer.find_by_uid(omniauth['uid'])
    if not customer
      # New customer registration
      customer = Customer.new(:uid => omniauth['uid'])
    end
    customer.email = omniauth['info']['email']
    customer.save

    #p omniauth

    # Currently storing all the info
    session[:customer_id] = omniauth

    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  # Omniauth failure callback
  def failure
    flash[:notice] = params[:message]
  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:customer_id] = nil

    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{CUSTOM_PROVIDER_URL}/customers/sign_out"
  end
end
