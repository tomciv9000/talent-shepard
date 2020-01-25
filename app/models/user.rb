require 'pry'
class User < ApplicationRecord
  
  before_save :admin_if_first_user
  #after_initialize :assign_fb_agency_id
 

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  
  belongs_to :agency
  acts_as_tenant(:agency)

    #validates :first_name, :last_name, presence: true
    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session[:fb_agency_id]
          user.agency_id = data if user.agency.blank?
        end
      end
      binding.pry
    end

    def self.from_omniauth(auth, extra)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.agency_id = extra
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        binding.pry
        #the below method should clear the session value out for the next time
        #session.delete(:fb_agency_id)
        #user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end
    
    def agency_if_any
        self.agency.name if self.agency
    end

    
    def display_details
        if self.admin 
          "Admin User - #{self.agency.name}"
        elsif self.confirmed
          "Confirmed User - #{self.agency.name}" 
        else
          "Unconfirmed User - #{self.agency.name}"
        end
    end

    private
    def admin_if_first_user
      if !self.agency.nil? && self.agency.users.count == 0
        self.assign_attributes(:admin => true, :confirmed => "true")
      end
    end

    #def assign_fb_agency_id
    #  binding.pry
    #  user.agency_id = session[:fb_agency_id] if session[:fb_agency_id]
    #end
    
end
