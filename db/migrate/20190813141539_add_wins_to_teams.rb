class AddWinsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :wins, :integer, :default => 0
    add_column :teams, :losses, :integer, :default => 0
    add_column :teams, :draws, :integer, :default => 0
  end
end
