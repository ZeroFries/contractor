class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	User.first!
  end

  def current_project
  	Project.first!
  end

  def current_role
  	current_user.role_for current_project.id
  end

  def current_trade
  	current_user.trade_for current_project.id
  end
end
