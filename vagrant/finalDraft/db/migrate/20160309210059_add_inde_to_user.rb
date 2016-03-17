class AddIndeToUser < ActiveRecord::Migration
  def change
  	add_index("applikations", "user_id")
  end
end
