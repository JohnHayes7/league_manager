class Location < ApplicationRecord
    has_many :matches

    validates :name, :presence => {:message => "Must Be Provided to create a new Location"},
                     :uniqueness => {:message => "Already exists in our Database"}

    validates :street_address,  :presence => {:message => "Must Be Provided to create a new Location"},
                                :uniqueness => {:message => "Already exists in our Database"}
                
    validates :city, :presence => {:message => "Must Be Provided to create a new Location"}
    validates :state, :presence => {:message => "Must Be Provided to create a new Location"}
    validates :zip_code,  :presence => {:message => "Must Be Provided to create a new Location"}
   
    
    def has_matches?
        !self.matches.empty?
    end

    def past_matches
        self.matches.where("date < ?", Time.zone.today)
    end

    def upcoming_matches
        self.matches.where("date >= ?", Time.zone.today)
    end
end
