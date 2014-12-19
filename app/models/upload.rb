class Upload < ActiveRecord::Base

	belongs_to :user
	belongs_to :project
	mount_uploader :file, UploadUploader

	validate :user_has_not_uploaded_for_project

	def user_has_not_uploaded_for_project
		users_who_have_uploaded_to_this_project = self.project.uploads.map {|upload| upload.user.id}
		if users_who_have_uploaded_to_this_project.uniq.include?(self.user.id)
			errors.add("base", "Sorry, you have already made a submission.")
		end
	end

end
