class Booking < ApplicationRecord
    include ResourceNames
    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :project
    
    validates :role, :actor_id, :project_id, presence: true

end
