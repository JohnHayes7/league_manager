class AddWinsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :wins, :integer
  end
end
