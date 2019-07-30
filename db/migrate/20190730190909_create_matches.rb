class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :date
      t.text :location_notes
      t.integer :location_id
      t.integer :competition_id
      t.integer :referee_id

      t.timestamps
    end
  end
end
