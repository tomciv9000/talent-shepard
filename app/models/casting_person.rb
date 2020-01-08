class CastingPerson < ApplicationRecord
    belongs_to :casting_office
    has_many :comments, as: :commentable
end
