delete casting_people from database
projects - belong to casting_office & agnecy(need agency_id)


talk about collection_select and preselected values being passed in based on the object passed into the form

talk about multi-tenant application

possibly update all form_for to form_with

possibly remove users as a nested resource to agencyies or attempt to make nested resoure users devise users

move nav bar to partial


<!DOCTYPE html>
<html>
  <head>
    <title>Talent Shepherd</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'false' %>
    
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'false' %>
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
   <a class="navbar-brand" href="#">TalentShepherd</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
     <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="<%= 'nav-item active' if current_page?(root_path) %>">
        <%= link_to root_path, :class => "nav-link" do %>Home
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(root_path) %>
        <% end %>
      </li>
  <% if !current_user %>
      <li class="<%= 'nav-item active' if current_page?(new_agency_path) %>">
        <%= link_to new_agency_path, :class => "nav-link" do %>Register Agency
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(new_agency_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(new_user_registration_path) %>">
        <%= link_to new_user_registration_path, :class => "nav-link" do %>User Sign Up
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(new_user_registration_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(new_user_session_path) %>">
        <%= link_to new_user_session_path, :class => "nav-link" do %>Log In
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(new_user_session_path) %>
        <% end %>
      </li>
  <% end %>
  <% if current_user %>
      <li class="<%= 'nav-item active' if current_page?(projects_path) %>">
        <%= link_to projects_path, :class => "nav-link" do %>Projects
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(projects_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(appointments_path) %>">
        <%= link_to appointments_path, :class => "nav-link" do %>Appointments
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(appointments_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(actors_path) %>">
        <%= link_to actors_path, :class => "nav-link" do %>Actors
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(actors_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(casting_offices_path) %>">
        <%= link_to casting_offices_path, :class => "nav-link" do %>Casting Offices
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(casting_offices_path) %>
        <% end %>
      </li>
      <li class="<%= 'nav-item active' if current_page?(bookings_path) %>">
        <%= link_to bookings_path, :class => "nav-link" do %>Bookings
          <%= (content_tag :span, "(current)", :class => "sr-only") if current_page?(bookings_path) %>
        <% end %>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= current_user.first_name %>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <%= link_to "Account Info", user_path(current_user), :class => "dropdown-item" %>
          <%= link_to "Edit Details", edit_user_registration_path(current_user), :class => "dropdown-item" %>
          <div class="dropdown-divider"></div>
          <%= link_to "Log Out", destroy_user_session_path, method: :delete, :class => "dropdown-item" %>
        </div>
      </li>
    <% end %>
    </ul>
  </div>
</nav>
  <div class="row">
  <div class="col-xs-10 col-xs-offset-1">
    <% flash.each do |type, msg| %>
      <% if type == "notice" %>
        <div class="alert alert-success">
      <% elsif type == "alert" %>
        <div class="alert alert-danger">
      <% else %>
        <div class='alert alert-<%= "#{type}" %>'>
      <% end %>
      <a href="#" class="close" data-dismiss="alert">&#215;</a>
      <ul>
        <li>
          <%= msg %>
        </li>
      </ul>
    <% end %>
  </div>
</div>
<div class="container">
  <%= yield %>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 </body>
</html>
