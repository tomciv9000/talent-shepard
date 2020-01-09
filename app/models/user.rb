class User < ApplicationRecord
    has_secure_password
    belongs_to :agency
   

    def first_user?
        !self.agency.nil? && self.agency.users.count == 0
    end

    def agency_name
        @user.agency.name || nil
    end
end
