class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "user_name", :limit => 10, null: false
      t.string "password_digest", null: false
      t.boolean "is_admin", null: false, default: false 
      t.timestamps null: false
    end
  end
end
