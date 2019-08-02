class DropDateFromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :date
  end
end
