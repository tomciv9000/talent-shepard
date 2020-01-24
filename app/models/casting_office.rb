class CastingOffice < ApplicationRecord
    include ResourceNames
    belongs_to :agency
    acts_as_tenant(:agency)

    has_many :projects
    
    has_many :appointments
    has_many :actors, through: :appointments
    
    validates :name, presence: true
    validates_uniqueness_of :name

end
