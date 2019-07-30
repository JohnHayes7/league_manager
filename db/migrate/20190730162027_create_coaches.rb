class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :phone_number
      t.boolean :admin, :default => false
      t.boolean :coach, :default => true
      t.boolean :referee, :default => false
      t.timestamps
    end
  end
end
