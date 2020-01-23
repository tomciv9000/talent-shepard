class Actor < ApplicationRecord
    belongs_to :agency
    acts_as_tenant(:agency)

    has_many :appointments
    has_many :casting_offices, through: :appointments
    has_many :bookings
    has_many :projects, through: :bookings
    
    scope :by_last_name, -> { order(last_name: :asc) }
    scope :sag_aftra, -> { by_last_name.where(sag_aftra: true) }
    scope :aea, -> { by_last_name.where(aea: true) }
    scope :non_union, -> { by_last_name.where(aea: false, sag_aftra: false  ) }
    
    

    def full_name
        self.first_name + " " + self.last_name
    end

end


