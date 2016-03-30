class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.string :adress
      t.belongs_to :systembolag, index: true
      t.timestamps null: false
    end
  end
end
