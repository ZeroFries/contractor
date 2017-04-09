class ProjectSessionsController < ApplicationController

	def create
		@project = current_user.projects.find(
			params[:project_id]
		)

		session[:current_project_id] = @project.id

		redirect_to @project
	end
end
