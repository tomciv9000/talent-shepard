class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
          "ADMIN - #{self.agency.name}"
        elsif self.confirmed
          "AUTHORIZED USER - #{self.agency.name}" 
        else
          "UNCONFIRMED USER - #{self.agency.name}"
        end
    end
    
end
