class Team < ApplicationRecord
    belongs_to :coach
    has_many :seasons
    has_many :players
    has_and_belongs_to_many :matches
    has_many :competitions, through: :matches

    accepts_nested_attributes_for :players

    def lose_coach
        binding.pry
        self. coach.teams.delete(self)
    end
end
