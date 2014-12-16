class Project < ActiveRecord::Base

	belongs_to :user
	has_many :likes
	has_many :didits
	has_many :uploads
	has_many :comments

	def score
		(likes.count + didits.count) * 2
	end

	def upload_count
		uploads.to_a.uniq{|x| x.user_id }.count
	end

	def total_points
		upload_count * 50
	end


  mount_uploader :file, ProjectFileUploader

end
