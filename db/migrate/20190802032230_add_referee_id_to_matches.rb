class AddRefereeIdToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :referee_id, :integer, :default => 1
  end
end
