class UploadsController < ApplicationController

	def new
		@project = Project.find(params[:project_id])
	  @upload = Upload.new
	end

	def create
		@project = Project.find(params[:project_id])
	  @upload = Upload.new(upload_params)
	  @upload.user_id = current_user.id
	  @upload.project_id = @project.id
	  redirect_to project_path(@project), notice: 'Image/file uploaded' if @upload.save
	end

private
  def upload_params
    params.require(:upload).permit(:file)
  end
end



