class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_project
  end

  def current_role
  end

  def current_trade
  end
end
