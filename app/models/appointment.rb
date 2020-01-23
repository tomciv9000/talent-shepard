class Appointment < ApplicationRecord
    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :casting_office
    belongs_to :project
    

    validates :role, :actor_id, :casting_office_id, :project_id, presence: true

end
