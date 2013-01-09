package trip.planner

// import converters for XML and JSON
import grails.converters.*

class AirportController {

    def geocoderService
    def scaffold = Airport

    def getXml = {
    	render Airport.findByIata(params.iata) as XML
    }

    def getJson = {
    	def airport = Airport.findByIata(params.iata)

    	if(!airport) {
    		airport = new Airport(iata:params.iata, name:"Not found")
    	}

    	render airport as JSON
    }

    def save = {
        def results = geocoderService.geocodeAirport(params.iata)
        def airport = new Airport(params + results)

        if(!airport.hasErrors() && airport.save()) {
            flash.message = "Airport ${airport.id} created"
            redirect(action: "show", id: airport.id)
        } else {
            render(view: 'create', model: [airport: airport])
        }
    }
}
