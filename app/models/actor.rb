class Actor < ApplicationRecord
    has_many :representations
    has_many :agencies, through: :representations
    has_many :appointments
    has_many :casting_offices, through: :appointments
    has_many :comments, as: :commentable
end
