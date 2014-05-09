class AddColumnToTitles < ActiveRecord::Migration
  def change
 		add_column :titles, :small_image, :binary
  end
end
