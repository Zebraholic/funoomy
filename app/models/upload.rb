class Upload < ActiveRecord::Base

	belongs_to :user
	belongs_to :project
	mount_uploader :file, UploadFileUploader

end
