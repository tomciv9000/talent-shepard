class Project < ApplicationRecord
    belongs_to :casting_office
    belongs_to :agency
    has_many :appointments
    has_many :bookings
    has_many :actors, through: bookings
    has_many :comments, as: :commentable

    def casting_office_name=(name)
        self.casting_office = CastingOffice.find_or_create_by(name: name)
    end

end
