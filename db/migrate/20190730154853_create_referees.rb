class CreateReferees < ActiveRecord::Migration[5.2]
  def change
    create_table :referees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.boolean :admin, :default => false
      t.boolean :coach, :default => false
      t.boolean :referee, :default => true
      t.timestamps
    end
  end
end
