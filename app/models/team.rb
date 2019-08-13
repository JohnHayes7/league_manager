class Team < ApplicationRecord
    belongs_to :coach
    has_many :seasons
    has_many :players
    has_and_belongs_to_many :matches
    has_many :competitions, through: :matches

    accepts_nested_attributes_for :players

    def lose_coach
        self.coach.teams.delete(self.id)
    end

    def past_matches
        self.matches.where("date < ?", Time.zone.today)
    end

    def upcoming_matches
        self.matches.where("date >= ?", Time.zone.today)
    end

    def record 
        "W: #{self.wins} - L: #{self.losses} - D: #{self.draws}
    end


end
