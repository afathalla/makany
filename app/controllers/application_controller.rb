# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include ApplicationHelper

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '2a4d5bd3ed0489dc0d98cc8757135dec'

  def require_person
      unless current_person
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_person_session_url
        return false
      end
    end
 
    def require_no_person
      if current_person
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url # fix root_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end
