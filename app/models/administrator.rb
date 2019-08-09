class Administrator < ApplicationRecord

    has_secure_password

    def first_name
        self.name.split.first
    end

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end
    

end

