class Match < ApplicationRecord
    belongs_to :competition
    belongs_to :referee
    belongs_to :location
    has_many :match_notes
    has_many :teams
    has_many :players, through: :teams
    has_many :coaches, through: :teams

    def location=(location_attrs)
        
        if !location_attrs[:name].blank? && !location_attrs[:street_address].blank?
            l = Location.find_or_create_by(:name => location_attrs[:name], :street_address => location_attrs[:street_address], :city => location_attrs[:city], :state => location_attrs[:state], :zip_code => location_attrs[:zip_code])     
            self.location_id = l.id
        end
    end

    def display_date
        binding.pry

    end

    
end
