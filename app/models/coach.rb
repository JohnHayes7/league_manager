class Coach < ApplicationRecord
    validates :name, :presence => {:message => "Must be Provided to Create an Account"}
    validates :email, :presence => {:message => "Must be Provided to Create an Account"},
                      :uniqueness => {:message => "This Email Address is already associated to an account.  Please Login"}
    validates :password, :length => {in: 6..10, :message => "must between 6 and 10 characters long"}
    validates :phone_number, :presence => {:message => "Must be Provided to Create an Account"}
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
