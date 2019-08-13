class AddWinnersLosersAndDrawTeamsToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :winner_id, :integer
    add_column :matches, :loser_id, :integer
    add_column :matches, :draw_team_1, :integer
    add_column :matches, :draw_team_2, :integer
  end
end
