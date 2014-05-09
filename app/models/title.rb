class Title < ActiveRecord::Base
	has_many :title_users, foreign_key: :user_id
	has_many :users, through: :title_users
	has_many :movie_categories, foreign_key: :title_id
	has_many :votes
	belongs_to :category, foreign_key: 'category_id', class_name: 'Category'
	validates_presence_of :title, :description

	def self.search_by_title(search_term)
		return [] if search_term.blank?
		where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
	end

end
