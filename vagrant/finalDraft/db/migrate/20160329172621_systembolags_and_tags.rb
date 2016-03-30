class SystembolagsAndTags < ActiveRecord::Migration
  def change

  	  create_table :systembolagsandtags do |t|
      t.belongs_to :systembolag, index: true
       t.belongs_to :tag, index: true
    end
  end
end
