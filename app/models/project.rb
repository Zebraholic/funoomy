class Project < ActiveRecord::Base

	belongs_to :user

	has_many :likes
  has_many :users, through: :likes

	has_many :didits
	has_many :uploads
	has_many :comments

	def upload_count
		uploads.count
		# uploads.to_a.uniq{|x| x.user_id }.count
	end

	def total_points
		upload_count * 50
	end


  mount_uploader :file, ProjectFileUploader

  acts_as_votable

  def liked?(user)
  	likes.where(user_id: user.id).count > 0
  end


end
