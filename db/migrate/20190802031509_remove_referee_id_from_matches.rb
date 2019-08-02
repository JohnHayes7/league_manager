class RemoveRefereeIdFromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :referee_id
  end
end
