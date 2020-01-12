class Booking < ApplicationRecord
    belongs_to :agency
    belongs_to :actor 
    belongs_to :project
    
end
