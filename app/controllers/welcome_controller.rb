class WelcomeController < ApplicationController
  def index
    if !current_user.nil?
      redirect_to dashboard_index_path
    end
  end
end
