class Administrator < ApplicationRecord

    has_secure_password

    def first_name
        self.name.split.first
    end

end

