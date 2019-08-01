class Competition < ApplicationRecord
    belongs_to :season
    has_many :matches

    def full_name
        "#{self.season.year} - #{self.name}"
    end
end
