class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
	end

	def show
		@events = current_project.events
		@change_order_requests = current_project.change_order_requests
		@date_change_requests = current_project.date_change_requests
		@notifications = current_project.notifications
	end
  
end
