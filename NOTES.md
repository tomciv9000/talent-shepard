
talk about collection_select and preselected values being passed in based on the object passed into the form

talk about multi-tenant application

possibly update all form_for to form_with

possibly remove users as a nested resource to agencyies or attempt to make nested resoure users devise users

move nav bar to partial

TO DO
- project form format
- actors pages
- appointment pages
- casting office pages
- bookings pages

ADMIN USERS CAN EDIT AGECENY - DROPDOWN LINK

INDEX PAGES MAYBE TABLES?

DELETE UNUSED VALUS (IE USERNAME ON USERS)


content_tag(:p, "Hello world!")
 # => <p>Hello world!</p>
content_tag(:div, content_tag(:p, "Hello world!"), class: "strong")
 # => <div class="strong"><p>Hello world!</p></div>
content_tag(:div, "Hello world!", class: ["strong", "highlight"])
 # => <div class="strong highlight">Hello world!</div>
content_tag("select", options, multiple: true)
 # => <select multiple="multiple">...options...</select>

<%= content_tag :div, class: "strong" do -%>
  Hello world!
<% end -%>
 # => <div class="strong">Hello world!</div>


 ONE FULL NAME METHOD
 