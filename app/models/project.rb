class Project < ApplicationRecord
    belongs_to :casting_office
    belongs_to :agency
    has_many :appointments
    has_many :bookings
    has_many :actors, through: bookings
    has_many :comments, as: :commentable
end
