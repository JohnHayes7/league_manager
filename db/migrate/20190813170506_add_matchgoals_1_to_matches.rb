class AddMatchgoals1ToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :matchgoals_1, :integer
    add_column :matches, :matchgoals_2, :integer
  end
end
