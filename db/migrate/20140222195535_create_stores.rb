class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :user_id
      t.decimal :longitude, :precision => 9,:scale => 6
      t.decimal :latitude, :precision => 9,:scale => 6
      t.timestamps
    end
  end
end
