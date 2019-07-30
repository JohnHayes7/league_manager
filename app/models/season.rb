class Season < ApplicationRecord
    has_many :competitions
    has_many :teams
    has_many :matches, through: :competitions
end
