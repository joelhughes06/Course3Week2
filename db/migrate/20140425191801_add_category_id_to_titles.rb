class AddCategoryIdToTitles < ActiveRecord::Migration
  def change
  	add_column :titles, :category_id, :string
  end
end
