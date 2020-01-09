class User < ApplicationRecord
    has_secure_password
    belongs_to :agency
   

    def first_user?
        !self.agency.nil? && self.agency.users.count == 0
    end

    def agency_name
        self.agency.name if self.agency
    end
    
end
