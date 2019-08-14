class Competition < ApplicationRecord
    belongs_to :season
    has_many :matches

    validates :name, :uniqueness => {:message => "already exists. You may add existing competition to your season."}

    def full_name
        "#{self.season.year} - #{self.name}"
    end
end
