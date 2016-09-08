class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  
  protected
  
    def user_not_authorized
      flash[:alert] = "Přístup zamítnut."
      
      redirect_to root_path #(request.referrer || root_path) #TODO: request.referrer makes loop for access denied : users#index
      
    end
  
end
