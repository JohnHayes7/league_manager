class AddGoalsForAndGoalsAgainstToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :goals_for, :integer, :default => 0
    add_column :teams, :goals_against, :integer, :default => 0
  end
end
