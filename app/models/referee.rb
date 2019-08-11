class Referee < ApplicationRecord
    has_many :matches
    has_many :match_notes

    validates :name, :presence => {:message => "Must be Provided to Create an Account"}
    validates :email, :presence => {:message => "Must be Provided to Create an Account"},
                      :uniqueness => {:message => "This Email Address is already associated to an account.  Please Login"}
    validates :password, :length => {in: 6..10, :message => "must between 6 and 10 characters long"}
    validates :phone, :presence => {:message => "Must be Provided to Create an Account"}

    has_secure_password

    def first_name
        self.name.split[0]
    end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

end
