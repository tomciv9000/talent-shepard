class Actor < ApplicationRecord
    belongs_to :account
    has_many :appointments
    has_many :casting_offices, through: :appointments
    has_many :comments, as: :commentable
end
