class Project < ApplicationRecord
    belongs_to :casting_office
    belongs_to :agency
    acts_as_tenant(:agency)
    has_many :appointments
    has_many :bookings
    has_many :actors, through: :bookings
    has_many :comments, as: :commentable
   
    
    accepts_nested_attributes_for :casting_office

    def casting_office_attributes=(casting_office_attributes)
        if !casting_office_attributes[:name].blank?
            self.casting_office = CastingOffice.find_or_create_by(name: casting_office_attributes[:name])  
            self.casting_office.agency_id = casting_office_attributes[:agency_id] 
        end
    end


end

