class Appointment < ApplicationRecord
    include ResourceNames
    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :casting_office
    belongs_to :project
    
    before_validation :assign_casting
    validates :role, :actor_id, :project_id, :casting_office_id, :time, presence: true

    scope :by_time, -> { order(time: :asc) }
    scope :callbacks, -> { by_time.where(callback: true) }

    def assign_casting
        self.casting_office_id = self.project.casting_office_id
    end
   
    def display_time
        self.time.strftime("%b %e, %l:%M %p")
    end
end
