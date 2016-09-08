class WelcomeController < ApplicationController
  def index
    @manager = Manager.new
  end
end
