class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper
    include UrlHelper
    
    before_action :set_locale
    before_action :load_contacts

private




    def load_contacts
        @contact = Contact.last
    end

    def set_locale
    	I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
    	{locale: I18n.locale}.merge options
    end

end
