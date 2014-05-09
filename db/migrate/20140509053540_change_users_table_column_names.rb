class ChangeUsersTableColumnNames < ActiveRecord::Migration
  def change
  	rename_column :users, :username, :email
  	rename_column :users, :firstname, :full_name
  	add_column :users, :created_at, :datetime
  	add_column :users, :updated_at, :datetime

  end

  def self.up
  	 remove_column :users, :lastname
  	 remove_column :users, :time_zone
  end

end
