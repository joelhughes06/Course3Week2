class User < ActiveRecord::Base
	has_many :title_users, foreign_key: :user_id
	has_many :titles, through: :title_users
	has_many :reviews
	has_many :votes
	validates_presence_of :email, :password, :full_name
	validates_uniqueness_of :email
	has_secure_password
	
end