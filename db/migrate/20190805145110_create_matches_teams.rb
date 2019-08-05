class CreateMatchesTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :matches_teams do |t|
      t.integer :match_id
      t.integer :team_id
    end
  end
end
