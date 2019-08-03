class Team < ApplicationRecord
    belongs_to :coach
    has_many :seasons
    has_many :players
    has_many :matches
    has_many :competitions, through: :matches
end
