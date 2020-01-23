class Agency < ApplicationRecord
    has_many :users
    has_many :actors
    has_many :projects
    has_many :appointments
    has_many :casting_offices
    has_many :bookings


  

end
