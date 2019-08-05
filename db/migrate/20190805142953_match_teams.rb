class MatchTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :match_teams do |t|
      t.integer :match_id
      t.integer :team_id
    end
  end
end
