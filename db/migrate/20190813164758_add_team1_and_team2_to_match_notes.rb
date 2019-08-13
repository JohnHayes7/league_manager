class AddTeam1AndTeam2ToMatchNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :match_notes, :team_1_goals, :integer
    add_column :match_notes, :team_2_goals, :integer
  end
end
