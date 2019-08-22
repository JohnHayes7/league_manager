class Competition < ApplicationRecord
    belongs_to :season
    has_many :matches
    has_many :teams, through: :matches

    validates :name, :uniqueness => {:message => "already exists. You may add existing competition to your season."}

    def full_name
        "#{self.season.year} - #{self.name}"
    end

    def self.most_active
        self.joins(:matches).select("competitions.*, count(matches.id) as cmatch").group("competitions.id").order("cmatch DESC")
    end
end
