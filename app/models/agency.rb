class Agency < ApplicationRecord
    has_many :users
    has_many :actors


  

end

#  params[:agency][:users_attributes]["0"]