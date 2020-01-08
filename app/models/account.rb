class Organization < ApplicationRecord
    has_many :users
    has_many :actors

    accepts_nested_attributes_for :users


  def users_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      if user_attribute["username"].present?
        user = user.find_or_create_by(user_attribute)
        self.users << user
      end
    end
  end
end
