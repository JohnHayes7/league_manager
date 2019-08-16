class Player < ApplicationRecord
    belongs_to :team
    has_many :matches, through: :team

    validates :name, :presence => {:message => "Must Be Provided to create a player"}
end
