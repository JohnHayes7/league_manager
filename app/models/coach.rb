class Coach < ApplicationRecord
    validates :name, :presence => {:message => "You Must Provide a Name to Create and Account"}
    validates :email, :presence => {:message => "You Must Provide a email to Create and Account"},
                      :uniqueness => {:message => "This Email Address is already associated to an account.  Please Login"}
    validates :password, :length => {in: 6..10, :message => "Passwords must between 6 and 10 characters long"}
    
    has_many :teams  
    has_many :matches, through: :teams 

    has_secure_password

    def last_name
        self.name.split[1]
    end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
