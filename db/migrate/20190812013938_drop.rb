class Drop < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :coach_id
  end
end
