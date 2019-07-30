class Player < ApplicationRecord
    belongs_to :team
    has_many :matches, through: :team
end
