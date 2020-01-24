class Actor < ApplicationRecord
    include ResourceNames
    belongs_to :agency
    acts_as_tenant(:agency)

    has_many :appointments, dependent: :destroy
    has_many :casting_offices, through: :appointments
    has_many :bookings, dependent: :destroy
    has_many :projects, through: :bookings
    
    scope :by_last_name, -> { order(last_name: :asc) }
    scope :sag_aftra, -> { by_last_name.where(sag_aftra: true) }
    scope :aea, -> { by_last_name.where(aea: true) }
    scope :non_union, -> { by_last_name.where(aea: false, sag_aftra: false  ) }
    
    validates :first_name, :last_name, :email, :dob, presence: true
    validates_uniqueness_of :email

    def full_name
       self.first_name.capitalize + " " + self.last_name.capitalize
    end

end


