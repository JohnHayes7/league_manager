class CreateMatchNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :match_notes do |t|
      t.text :content
      t.integer :referee_id
      t.integer :match_id

      t.timestamps
    end
  end
end
