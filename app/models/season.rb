class Season < ApplicationRecord
    has_many :competitions
    has_many :teams
    has_many :matches, through: :competitions

    validates :year, :uniqueness => {:message => "already exists in the database"}

    def competitions_attributes=(comp_attrs)
        if !comp_attrs[:"0"][:name].blank?
            comp = Competition.find_or_create_by(name: comp_attrs[:"0"][:name])
            self.competitions << comp
        end  
    end

    def competition_ids=(ids)
        ids.each do |id|
            if id != ""
                comp = Competition.find(id)
                self.competitions << comp
            end
        end
    end

end
