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

### Create only a controller

To create a controller for the `Airport` domain class:

    grails create-controller Airport

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

### Services

Services are places where you can store commonly used methods that transcend any single domain class.
I see them as places where you can put your bussiness logic that affects several domain classes, or
code that relates to third party functionalities.

With the command:

    grails create-service Geocoder

we create a service in `grails-app/services/trip/planner/GeocoderService.groovy`

### RESTful grails

Tha Atom publishing protocol is a popular syndication format that follows RESTful principles. The authors
of the RFC for Atom try to end the POST vs. PUT debate definitevely:

* GET is used to retrieve a representation of a known Resource
* POST is used to create a new, dynamically named, Resource
* PUT is used to edit a known Resource. It is not used for creation
* DELETE is used to remove a known Resource

To implement a RESTful functionality in grails, follow this steps:

1. choose an action of a controller to handle the four request types (get, post, ...), for example, choose
the controller `Airport` and `restful` action. You will invoke the REST functionality this way: 
http://localhost:8008/trip-planner/airport/restful
2. customize the url mappings in the file `UrlMappings.groovy` to handel RESTful request with your
new action. Your new REST URL will be http://localhost:8080/trip-planner/rest/airport/restful

    "/rest/airport/restful/$iata?"(controller: "airport", action: "restful")

3. Thats all, you can test it with the [cURL application](http://curl.haxx.se/):

    curl --request GET http://localhost:8080/rest/airport/restful

### MIME types

In the file `Config.groovy` we can find the key `grails.mime.types` with a map that contains the supported
mime types and their values that are expected to be in the Header of a HTML request

### URL mappings

One can customize URL mappings simply by editing a groovy file: `UrlMappings.groovy`. This will allow you
to specify how URL's map to certain actions in your Controllers.

### Testing in grails

Every time you create a domain class, or a controller, or a service, ... grails create a test class for you.
You can use these test classes to perform integration tests of your newly created code.

Don't test grails code, or grails generated code. The effort is not worthy. Focus on test your own code.

To create a unit test, that is, a test to exercise a single class, not in a full and running environment, 
you can use the command `grails create-unit-test trip.planner.MyTestUnit`

### Testing domain classes

Some methods, and properties of domain classes that are usefull to test them:

        assert !domainClass.validate()
        assert domainClass.hasErrors()
        // search for a field called hotel that contains errors
        def badField = domainClass.errors.getFieldError('hotel')
        assert badField != null
        // search for the error message code telling that the hotel field is blank
        def code = badField.codes.find { it == "domainClass.hotel.blank" }
        assert code != null

### Error messages

You can find a properties file describing all error messages in the following paht 
`grails-app/i18n/messages.properties` 

### Remote forms

Using `<g:formRemote>` in a GSP file, you make an `Ajax.Request` perform the form submission
asynchronously behind the scenes.