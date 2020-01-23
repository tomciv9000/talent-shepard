class Agency < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :actors, dependent: :destroy
    has_many :projects, dependent: :destroy
    has_many :appointments, dependent: :destroy
    has_many :casting_offices, dependent: :destroy
    has_many :bookings, dependent: :destroy

    validates :name, :email, presence: true
    validates_uniqueness_of :email, :name
  

end
