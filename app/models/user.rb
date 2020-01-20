class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :admin_if_first_user
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    belongs_to :agency
    acts_as_tenant(:agency)
   

    #def first_user?
    #    !self.agency.nil? && self.agency.users.count == 0
    #end

    def agency_if_any
        self.agency.name if self.agency
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

    private
    def admin_if_first_user
      if !self.agency.nil? && self.agency.users.count == 0
        self.assign_attributes(:admin => true, :confirmed => "true")
      end
    end
    
end
