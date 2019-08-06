class Referee < ApplicationRecord
    has_many :matches
    has_many :match_notes

    has_secure_password
end
