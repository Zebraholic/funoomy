class Project < ActiveRecord::Base

	belongs_to :user
	has_many :likes
	has_many :didits
	has_many :uploads
	has_many :comments

	def score
		(likes.count + didits.count) * 2
	end
  mount_uploader :file, ProjectFileUploader
  # accepts_nested_attributes_for :uploads

end
