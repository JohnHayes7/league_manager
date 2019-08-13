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

    def wins
        Match.where("winner_id == #{self.id}").count
    end

    def losses
        Match.where("loser_id == #{self.id}").count
    end

    def draws
        Match.where("draw_team_1 = #{self.id}").count + Match.where("draw_team_2 = #{self.id}").count
    end

    def record 
        "W: #{self.wins} - L: #{self.losses} - D: #{self.draws}"
    end

    def stats
        "GF: #{self.goals_for} GA: #{self.goals_against}"
    end


end
