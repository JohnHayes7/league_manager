class Competition < ApplicationRecord
    belongs_to :season
    has_many :matches
end
