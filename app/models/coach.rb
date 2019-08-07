class Coach < ApplicationRecord
    has_many :teams  
    has_many :matches, through: :teams 

    def last_name
        self.name.split[1]
    end
end
