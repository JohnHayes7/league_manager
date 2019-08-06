class Referee < ApplicationRecord
    has_many :matches
    has_many :match_notes

    has_secure_password

    def first_name
        self.name.split[0]
    end
end
