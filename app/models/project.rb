class Project < ApplicationRecord
    include ResourceNames
    belongs_to :casting_office
    belongs_to :agency
    acts_as_tenant(:agency)
    has_many :appointments, dependent: :destroy
    has_many :bookings, dependent: :destroy
    has_many :actors, through: :bookings
   
    validates :name, :media_type, :casting_office_id, presence: true

    scope :by_start_date, -> { order(start_date: :asc) }
    scope :stage, -> { by_start_date.where(media_type: 'Stage') }
    scope :film, -> { by_start_date.where(media_type: 'Film') }
    scope :commercial, -> { by_start_date.where(media_type: 'Commercial') }
    scope :industrial, -> { by_start_date.where(media_type: 'Industrial') }
    scope :short, -> { by_start_date.where(media_type: 'Short') }
    scope :new_media, -> { by_start_date.where(media_type: 'New Media') }
   
    
    
    accepts_nested_attributes_for :casting_office

    def casting_office_attributes=(casting_office_attributes)
        if !casting_office_attributes[:name].blank?
            self.casting_office = CastingOffice.find_or_create_by(name: casting_office_attributes[:name])  
            self.casting_office.agency_id = casting_office_attributes[:agency_id] 
        end
    end


end

