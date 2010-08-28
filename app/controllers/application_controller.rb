# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  layout 'application'
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :set_locale
  
  private
    def set_locale
      params[:locale] ||= session[:locale]
      
      if params[:locale]
        I18n.locale = session[:locale] = params[:locale]
      else
        logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"  
        I18n.locale = extract_locale_from_accept_language_header 
        logger.debug "* Locale set to '#{I18n.locale}'"
      end
    end
    
    def extract_locale_from_accept_language_header 
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end 
end
