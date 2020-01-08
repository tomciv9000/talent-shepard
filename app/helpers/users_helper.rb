module UsersHelper

    def full_name(person)
        person.first_name + " " + person.last_name
    end
    
    
    def agency_id_field(user)
      if user.agency.nil?
        select_tag "user[agency_id]", options_from_collection_for_select(Agency.all, :id, :name), prompt: "Please select your Agency"
      else
        hidden_field_tag "user[agency_id]", user.agency_id
      end
    end

    def agency_name
        @user.agency.name if @user.agency
    end

    def logged_in?
        session[:user_id].present?
    end

    def first_user?(user)
        !user.agency.nil? && user.agency.users.count <= 1
    end



    def admin_status(user)
        if first_user?(user)
            f.label :admin, "Administrator" 
            f.check_box :admin, {checked: true, disabled:true}
            "By default, the first user is an administrator.  This can be changed later."
        else
            f.label :admin, "Administrator" 
            f.check_box :admin, {checked: false}
        end
    end
end
