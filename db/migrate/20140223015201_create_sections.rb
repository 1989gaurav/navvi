class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :floor
      t.decimal :longitude
      t.decimal :latitude
      t.string :nick

      t.timestamps
    end
    add_index :sections, :floor_id
  end
end
