class Coach < ApplicationRecord
    has_many :teams  
    has_many :matches, through: :teams 
end
