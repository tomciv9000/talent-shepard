module UsersHelper
  
  def agency_id_field(user)
    if user.agency.nil?
      select_tag "user[agency_id]", options_from_collection_for_select(Agency.all, :id, :name), prompt: "Please select your Agency"
    else
      hidden_field_tag "user[agency_id]", user.agency_id
    end
  end

  def edit_if_allowed(user)
    if user.id == current_user.id || current_user.admin
      link_to "Edit User Details", edit_user_path(user)
    end
  end

    #def admin_field(user)
    #    check_box(nil, nil, {checked: true, disabled:true}) if user.first_user?
    #    #disabled checkbox for first user
    #end

    #def default_admin_check(user)
    #    hidden_field_tag "user[admin]", "true" if user.first_user?
    #end

    #ef confirm_first_user(user)
    #   hidden_field_tag "user[confirmed]", "true" if user.first_user?
    #nd
    #
    #ef user_role(user)
    #   if user.admin || user.first_user?
    #       "Admin" 
    #   else
    #       "Standard User"
    #   end
    #nd
    


    ##### this is the flow of helpers required to reder forms

  





end


