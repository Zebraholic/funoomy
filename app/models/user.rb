class User < ActiveRecord::Base

  authenticates_with_sorcery!

  #owned projects
  has_many :projects

  has_many :likes
  has_many :projects, through: :likes

  has_many :didits
  has_many :uploads

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true  

	def upload_count
		uploads.count
		# uploads.to_a.uniq{|x| x.user_id }.count
	end

	def total_points
		uploads.count * 50
	end

  def liked?(project)
    liked_projects.include?(project)
  end

end
