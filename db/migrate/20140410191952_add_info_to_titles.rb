class AddInfoToTitles < ActiveRecord::Migration
  def change
  	add_column :titles, :title, :string
  	add_column :titles, :year, :string
  	add_column :titles, :description, :text
  	add_column :titles, :rated, :string
  end
end
