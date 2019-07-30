class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, :default => true  
      t.boolean :coach, :default => false
      t.boolean :referee, :default => false
      t.timestamps
    end
  end
end
