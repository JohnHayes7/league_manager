class AddPhoneNumberAndEmailToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :phone_number, :string
    add_column :players, :email, :string
  end
end
