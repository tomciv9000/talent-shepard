class User < ApplicationRecord
  
  before_save :admin_if_first_user
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    belongs_to :agency
    acts_as_tenant(:agency)

    validates :first_name, :last_name, presence: true
    

    def agency_if_any
        self.agency.name if self.agency
    end

    
    def display_details
        if self.admin 
          "Admin User - #{self.agency.name}"
        elsif self.confirmed
          "Confirmed User - #{self.agency.name}" 
        else
          "Unconfirmed User - #{self.agency.name}"
        end
    end

    private
    def admin_if_first_user
      if !self.agency.nil? && self.agency.users.count == 0
        self.assign_attributes(:admin => true, :confirmed => "true")
      end
    end
    
end
