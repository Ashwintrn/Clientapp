class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    byebug
    if !current_customer
      respond_to do |format|
        # format.html  {
        #   redirect_to '/auth'
        # }
        format.json {
          render :json => { 'error' => 'Access Denied' }
        }
      end
    end
  end

  def current_customer
    return nil unless session[:customer_id]
    @current_customer ||= Customer.find_by_uid(session[:customer_id]['uid'])
  end
end