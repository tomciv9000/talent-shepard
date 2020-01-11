class Booking < ApplicationRecord
    belongs_to :agency
    belongs_to :actor 
    bleongs_to :project
end
