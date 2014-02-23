class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.references :store
      t.string :nick

      t.timestamps
    end
    add_index :floors, :store_id
    add_index :floors, :nick
  end
end
