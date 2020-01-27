class User < ApplicationRecord
  before_save :admin_if_first_user

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  belongs_to :agency
  acts_as_tenant(:agency)

    def self.from_omniauth(auth, extra)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.agency_id = extra
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        binding.pry
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

end
