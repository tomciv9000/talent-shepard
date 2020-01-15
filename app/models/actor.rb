class Actor < ApplicationRecord
    belongs_to :agency
    acts_as_tenant(:agency)
    has_many :appointments
    has_many :casting_offices, through: :appointments
    has_many :bookings
    has_many :projects, through: :bookings
    has_many :comments, as: :commentable
end
