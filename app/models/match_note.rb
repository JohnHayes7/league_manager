class MatchNote < ApplicationRecord
    belongs_to :referee
    belongs_to :match
end
