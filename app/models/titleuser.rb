class TitleUsers < ActiveRecord::Base
	belongs_to :user, foreign_key: :user_id
	belongs_to :title, foreign_key: :title_id
end
