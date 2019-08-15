class Match < ApplicationRecord
    belongs_to :competition
    belongs_to :referee
    belongs_to :location
    has_many :match_notes
    has_and_belongs_to_many :teams
    has_many :players, through: :teams
    has_many :coaches, through: :teams

    def location=(location_attrs)
        
        if !location_attrs[:name].blank? && !location_attrs[:street_address].blank?
            l = Location.find_or_create_by(:name => location_attrs[:name], :street_address => location_attrs[:street_address], :city => location_attrs[:city], :state => location_attrs[:state], :zip_code => location_attrs[:zip_code])     
            binding.pry
            self.location_id = l.id
            self.save
        end
    end

    def date_and_time
        "#{self.date} #{self.time}"
    end

    def teams_display
        if  self.teams[0] == nil
                 "TBD" 
        elsif self.teams[1] == nil
                "TBD"
        else
            "#{self.teams[0].name} vs. #{self.teams[1].name}"
        end
    end

    def assign_ref(id)
        self.referee_id = id
        self.save
    end

    def unassign_ref
        self.referee_id = 1
        self.save
    end

    def teams_count_valid?(count)
        count <= 3
    end

    def self.unassigned
        # referee_id: 1 is the id of "No Referee assigned to this match"
        self.where(("referee_id = 1"))
    end

    def notes
        MatchNote.where("match_id = #{self.id}")
    end

    def result
        if self.matchgoals_1 > self.matchgoals_2
            self.winner_id = self.teams[0].id
            self.loser_id = self.teams[1].id
            self.save
            "Result: #{self.teams[0].name} Win #{self.matchgoals_1} - #{self.matchgoals_2}"
        elsif self.matchgoals_1 < self.matchgoals_2
            self.winner_id = self.teams[1].id
            self.loser_id = self.teams[0].id
            self.save
            "Result: #{self.teams[1].name} Win #{self.matchgoals_1} - #{self.matchgoals_2}"
        else  
            self.draw_team_1 = self.teams[0].id
            self.draw_team_2 = self.teams[1].id
            self.save
            "Result: Draw #{self.matchgoals_1} - #{self.matchgoals_2}"
        end
    end

    def goals_update(params)
        if !params[:match_note][:team_1_goals].empty? && !params[:match_note][:team_2_goals].empty?
            self.matchgoals_1 = params[:match_note][:team_1_goals]
            self.matchgoals_2 = params[:match_note][:team_2_goals]
            self.save
        end
    end
    
   
end
