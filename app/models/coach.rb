class Coach < ApplicationRecord
    has_many :teams  
    has_many :matches, through: :teams 

    has_secure_password

    def last_name
        self.name.split[1]
    end
end
