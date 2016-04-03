class SystembolagsAndTags < ActiveRecord::Migration
  def change

  	  create_table :systembolags_tags do |t|
      t.belongs_to :systembolag, index: true
       t.belongs_to :tag, index: true
    end
  end
end
