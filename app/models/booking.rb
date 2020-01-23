class Booking < ApplicationRecord
    belongs_to :agency
    acts_as_tenant(:agency)
    
    belongs_to :actor 
    belongs_to :project
    
end
