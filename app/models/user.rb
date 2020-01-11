class User < ApplicationRecord
    has_secure_password
    belongs_to :agency
    acts_as_tenant(:agency)
   

    def first_user?
        !self.agency.nil? && self.agency.users.count == 0
    end

    def agency_if_any
        self.agency.name if self.agency
    end

    def assign_defaults
        self.assign_attributes(:admin => true, :confirmed => "true") if self.first_user?
    end
    
    def display_details
        if self.admin 
          "ADMIN"
        elsif self.confirmed
          "AUTHORIZED USER"
        else
          "UNCONFIRMED USER"
        end
    end
    
end
