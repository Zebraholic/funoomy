class Project < ActiveRecord::Base

	belongs_to :user
	has_many :likes
	has_many :didits
	has_many :uploads

	def score
		(likes.count + didits.count) * 2
	end

end
