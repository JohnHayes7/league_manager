class AddJerseyNumberToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :jersey_number, :string
  end
end
