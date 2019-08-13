class AddMatchgoalsToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :matchgoals, :integer
  end
end
