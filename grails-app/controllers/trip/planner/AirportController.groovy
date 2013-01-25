package trip.planner

// import converters for XML and JSON
import grails.converters.*

class AirportController {

    def geocoderService
    def scaffold = Airport

    def debugAccept = {
        def clientRequest = request.getHeader("accept")
        def serverResponse = request.format
        render "Client: ${clientRequest}\nServer: ${serverResponse}\n"
    }

    def xmlList = {
        render Airport.list() as XML
    }

    def xmlShow = {
    	render Airport.findByIata(params.id) as XML
    }

    def list = {
        if(!params.max) params.max = 10

        def list = Airport.list(params)
        withFormat {
            html {
                return [airportList: list]
            }
            xml {
                render list as XML
            }
        }
    }

    def index = {
        switch(request.method) {
        case "GET":
            if(params.iata) render Airport.findByIata(params.iata) as XML
            else render Airport.list() as XML
            break
        case "POST":
            render "create\n"
            break
        case "PUT":
            render "update\n"
            break
        case "DELETE":
            render "remove\n"
            break
        }
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

    def iata = {
        def iata = params.id?.toUpperCase() ?: "NO IATA"
        def results = geocoderService.geocodeAirport(iata)
        def airport

        if(results) {
            airport = new Airport( [ iata: iata ] + results)
        } else {
            airport = new Airport(iata: iata, name: "Not found")
        }

        render airport as JSON
    }
}
