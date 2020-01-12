class Project < ApplicationRecord
    belongs_to :casting_office
    belongs_to :agency
    has_many :appointments
    has_many :bookings
    has_many :actors, through: bookings
    has_many :comments, as: :commentable
    
    accepts_nested_attributes_for :casting_office

    def casting_office_attributes=(name)
        self.casting_office = CastingOffice.find_or_create_by(name: casting_office_attributes[:name]) unless casting_office_attributes[:name].blank?
    end

end
