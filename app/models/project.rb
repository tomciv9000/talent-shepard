class Project < ApplicationRecord
    belongs_to :casting_office
    belongs_to :agency
    acts_as_tenant(:agency)
    has_many :appointments
    has_many :bookings
    has_many :actors, through: :bookings
    has_many :comments, as: :commentable
   
    
    accepts_nested_attributes_for :casting_office

    def casting_office_attributes=(name)
        self.casting_office = CastingOffice.find_or_create_by(name: casting_office_attributes[:name]) unless casting_office_attributes[:name].blank?
    end

end

#params[:project]
#=> <ActionController::Parameters {"agency_id"=>"", "name"=>"Breakfast at Tiffanys", "media_type"=>"Feature Film", "start_date(1i)"=>"2020", "start_date(2i)"=>"5", "start_date(3i)"=>"6", "union"=>"SAG-AFTRA", "notes"=>"Could be interesting.", "user"=>{"name"=>"Bowling-Mischia"}} permitted: false>
