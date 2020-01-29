# Talent Shepherd

Talent Shepherd is a multi-tenant content management system designed to assist with the workflow for a standard talent agency or talent management office.

Features:

* Create an Agency with multiple Users.  This agency serves as the 'tenant', or umbrella account.
* Manage the data associated with Actors, Projects, Audition Appointments, Bookings, and Casting Offices.
* Utilize Admin functions to restrict access to unconfirmed users.

To begin, create an Agency from which all Users will operate.  Upon creation, a form to create a new User will prompt for more specific information.  Every Agency's first User account will automatically be label as an 'Admin'.  Admin have edit and delete privledges whereas regular Users do not.  Admin also have the ability to confirm new Users as 'confirmed users' which enables read and write privledges.

