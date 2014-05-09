class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
	    t.string "name"
	    t.string "description"
	    t.datetime "created_at", :null => false
	    t.datetime "updated_at", :null => false
    end
  end
end
