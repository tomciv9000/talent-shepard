module UsersHelper
  
  def agency_id_field(user)
    if user.agency.nil?
      select_tag "user[agency_id]", options_from_collection_for_select(Agency.all, :id, :name), prompt: "Please select your Agency"
    else
      hidden_field_tag "user[agency_id]", user.agency_id
    end
  end

  def edit_if_allowed(user)
    if user.id == current_user.id 
      link_to "Edit #{full_name(user)}'s Details", edit_user_registration_path(user)
    end
  end


end


