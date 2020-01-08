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

    def first_user?(user)
        !user.agency.nil? && user.agency.users.count <= 1
    end

    def first_admin(user)
        hidden_field_tag "user[admin]", "true" if first_user?(user)
    end

    def confirm_first_user(user)
        hidden_field_tag "user[confirmed]", "true" if first_user?(user)
    end
    

    def admin_field(user)
        if first_user?(user)
            #disabled checkbox for first user
            check_box(nil, nil, {checked: true, disabled:true})
        else
            check_box "user[admin]", checked: false
        end
    end

    def agency_id_field(user)
        if user.agency.nil?
          select_tag "user[agency_id]", options_from_collection_for_select(Agency.all, :id, :name), prompt: "Please select your Agency"
        else
          hidden_field_tag "user[agency_id]", user.agency_id
        end
      end






end


