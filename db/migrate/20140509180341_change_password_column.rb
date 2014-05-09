class ChangePasswordColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :lastname
  	remove_column :users, :time_zone
  	add_column :users, :password_digest, :string

  end
end
