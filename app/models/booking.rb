class Booking < ApplicationRecord
    include ResourceNames
    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :project
    
    validates :role, :rate, :actor_id, :project_id, presence: true

    scope :accepted, -> { where(accepted: true) }
    scope :signed, -> { where(contract_signed: true) }
    scope :done_deals, -> { where(accepted: true, contract_signed: true  ) }
end
