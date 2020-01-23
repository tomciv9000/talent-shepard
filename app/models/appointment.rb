class Appointment < ApplicationRecord

    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :casting_office
    belongs_to :project
    
    before_validation :assign_casting
    validates :role, :actor_id, :project_id, :casting_office_id, :time, presence: true

    def assign_casting
        self.casting_office_id = self.project.casting_office_id
    end
   
end
