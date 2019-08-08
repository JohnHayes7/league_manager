class AddAdminRefereeCoachToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :referee, :boolean
    add_column :users, :coach, :boolean
  end
end
