# Trip planner

A grails application developed while performing the grails tutorial called [Build your first grails app](http://grails.org/tutorial/6) 

# Step by step tutorial follow up

### Create the application

    grails create-app trip-planner

It creates a directory containing the grails application. Inside, you will find a directory structure.
It is a fixed structure following the *convention over configuration* philosofy.

### Create your first domain class

Inside the trip-planner directory, type:

    grails create-domain-class Trip

What does *domain class* mean? Domain classes are where the data of your application is stored. Domain classes are mapped to tables in the database.

You get a list of usefull methods to handle Trip instances:

- Trip.save()
- Trip.delete()
- Trip.list()
- Trip.get()

### Create controllers and views

    grails generate-all trip.planner.Trip

It creates the controller and its corresponding views under:

- grails-app/controllers/TripController.groovy
- grails-app/views/Trip

Every action in a controller pairs up with a view based on the name of the action:

- TripController.list -> Trip/list.gsp
- and so on ...

### Run the applicaton

    grails -Dserver.port=9090 run-app

### Test the application

    grails test-app

And open a navigator to point at address: http://localhost:9090/trip-planner

    grails -Dserver.port=9090 prod run-app

to run in **production** mode

### one-to-many relationships in the database

Given Airline objects, it is possible to have many trips traveled with one Airline, so Airline is the 'one'
in the relationship and Trip is the 'many'.

Define a `static hasMany = [trip: Trip]` hashmap in Airline, and a `static belongsTo = [airline: Airline]` map in Trip to create this kind of
relationship.

Using `static belongsTo = Airline` adds another dimension to the relationship: cascading updates and deletes.

### validacion de datos

Add a `static constraints` closure to Airline domain class. 

    static constraints = {
        name(blank: false, maxSize: 100)
        url(url: true)
        frequentFlyer(blank: true)
        notes(maxSize: 1500)
    }

There is a lot of usefull validation rules, try: blank, maxSize, url, email, ...

Search for more validation rules in the grails online documentation.

### understanding DataSource.groovy

The database specific configurations that are shared across all domain classes are stored in a common
file: `grails-app/conf/DataSource.groovy`.

Pointing grails to a new database is a quick three-step process:

1. create the database and log in
2. copy de JDBC driver to the lib directory
3. adjust the settings in `DataSource.groovy`

# Views

### javascript

All javascript files are stored in the directory `web-app/js`

### Create a custom tag lib

Run the command `grails create-tag-lib (a name)`.

### Define a custom tag lib with attributes

In a custom tag lib class, define a closure with two parameters

    def copyright = { attrs, body
        // ...
    }

`attrs` is a map with the tab attributes, `body` is a closure representing the body of the tag, to be
able to nest custom tags.

If you'd like to place your TagLibs in a custom namespace, add `static namespace = 'trip'` to the tag lib
definition class. In your GSP, the tag lib should be `<trip:copyright ...>` instead of `<g:copyright ...>`

### Customize the default scaffolding

To customize the default scaffolding, type `grails install-templates`. This adds a new src/templates 
directory to the project. You should see three directories named artifacts, scaffolding and war.

To use our new custom tag lib, open a `list.gsp` page and add the follwing to the end:

    <g:render template="/footer" />

This will show the result of our new tab lib in **all** list pages.

### Generate views to customize them

With the command `grails generate-views Flight`, we can generate the scaffolding views for the Flight
domain class. Then, we have a set of views to modify and customize whatever we want.


