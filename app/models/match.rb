class Match < ApplicationRecord
    belongs_to :competition
    belongs_to :referee
    belongs_to :location
    has_many :match_notes
    has_many :teams
    has_many :players, through: :teams
    has_many :coaches, through: :teams
end
