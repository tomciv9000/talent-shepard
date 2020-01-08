class Appointment < ApplicationRecord
    belongs_to :actor 
    belongs_to :casting_office
    belongs_to :project
    has_many :comments, as: :commentable
end
