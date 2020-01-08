class Project < ApplicationRecord
    belongs_to :casting_office
    has_many :appointments
    has_many :comments, as: :commentable
end
