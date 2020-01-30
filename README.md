# Talent Shepherd

Thanks for taking a look at my application.  Talent Shepherd is a multi-tenant content management system designed to assist with the workflow for a standard talent agency or talent management office.


## Installation

To use this app, just clone this [repo](https://github.com/tomciv9000/talent-shepherd).

And then execute:

    $ bundle

## Usage

Step 1) Run: `rails s`
Step 2) Create an Agency Account or Sign Up with an existing Agency
Step 3) Create your User account and begin!

## Features:

* Create an Agency with multiple Users.  This agency serves as the 'tenant', or umbrella account.
* Manage the data associated with Actors, Projects, Audition Appointments, Bookings, and Casting Offices.
* Utilize Admin functions to restrict access to unconfirmed users.

To begin, create an Agency from which all Users will operate.  Upon creation, a form to create a new User will prompt for more specific information.  Every Agency's first User account will automatically be label as an 'Admin'.  Admin have edit and delete privledges whereas regular Users do not.  Admin also have the ability to confirm new Users as 'confirmed users' which enables read and write privledges.

With an Admin account or Confirmed User account, specific privledges will be enabled.  

For confirmed Users, this includes:

* Create Actor records which track the actor's name, union-status, email, gender portrayal, as well as notes.
* Create Project records which track entertainment projects open to casting.
* Create Casting Office records which track details regarding relevent Casting Groups.
* Create Appointments for auditions, which are associated with the correct Actor, Project, and Casting Office.
* Create Booking records which record informatin about Projects for which the Actor has been booked.

For admin Users, privlegdes allow records to be edited and deleted.  Admin users are also able to confirm unconfirmed users and add Admin privledges to confirmed Users.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomciv9000/talent-shepherd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).





Features:

* Create an Agency with multiple Users.  This agency serves as the 'tenant', or umbrella account.
* Manage the data associated with Actors, Projects, Audition Appointments, Bookings, and Casting Offices.
* Utilize Admin functions to restrict access to unconfirmed users.

To begin, create an Agency from which all Users will operate.  Upon creation, a form to create a new User will prompt for more specific information.  Every Agency's first User account will automatically be label as an 'Admin'.  Admin have edit and delete privledges whereas regular Users do not.  Admin also have the ability to confirm new Users as 'confirmed users' which enables read and write privledges.

With an Admin account or Confirmed User account, specific privledges will be enabled.  

For confirmed Users, this includes:

* Create Actor records which track the actor's name, union-status, email, gender portrayal, as well as notes.
* Create Project records which track entertainment projects open to casting.
* Create Casting Office records which track details regarding relevent Casting Groups.
* Create Appointments for auditions, which are associated with the correct Actor, Project, and Casting Office.
* Create Booking records which record informatin about Projects for which the Actor has been booked.

For admin Users, privlegdes allow records to be edited and deleted.  Admin users are also able to confirm unconfirmed users and add Admin privledges to confirmed Users.