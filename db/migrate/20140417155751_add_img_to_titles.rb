class AddImgToTitles < ActiveRecord::Migration
  def change
  	add_column :titles, :image, :binary
  	add_column :titles, :stars, :float
  	add_column :titles, :reviews, :text
  end
end
