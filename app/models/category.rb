class Category < ActiveRecord::Base
	has_many :titles, -> { order "created_at DESC" }

	def recent_videos
		titles.first(6)
	end
end