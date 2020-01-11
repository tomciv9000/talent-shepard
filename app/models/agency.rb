class Agency < ApplicationRecord
    has_many :users
    has_many :actors
    has_many :projects


  

end
