delete casting_people from database
projects - belong to casting_office & agnecy(need agency_id)


talk about collection_select and preselected values being passed in based on the object passed into the form

talk about multi-tenant application

possibly update all form_for to form_with

possibly remove users as a nested resource to agencyies or attempt to make nested resoure users devise users


<nav>
    <%= link_to "Home |  ", root_path %>
    <% if !current_user %>
      <%= link_to "Register New Agency |  ", new_agency_path %>
      <%= link_to "Sign Up |  ", new_user_registration_path %>
      <%= link_to('Log in', new_user_session_path) %>
    <% end %>
    <% if current_user %>
      <%= link_to "Projects |  ", projects_path %>
      <%= link_to "Appointments |  ", appointments_path %>
      <%= link_to "Actors |  ", actors_path %>
      <%= link_to "Casting Offices |  ", casting_offices_path %>
      <%= link_to "Bookings |  ", bookings_path %>
      <%= link_to "#{current_user.first_name}'s Account |  ", edit_user_registration_path %>
      <%= link_to('Logout', destroy_user_session_path, method: :delete) %>
    <% end %>
  </nav>