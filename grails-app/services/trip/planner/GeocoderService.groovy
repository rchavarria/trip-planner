package trip.planner

class GeocoderService {

	boolean transactional = true

    def geocodeAirport(String iata) {
    	def base = "http://ws.geonames.org/search?"

        def qs = []
    	qs << "name_equals=" + URLEncoder.encode(iata)
    	qs << "fcode=airp"
    	qs << "style=full"
    	def url = new URL(base + qs.join("&"))
    	def connection = url.openConnection()

    	def result = [:]
    	if(connection.responseCode == 200) {
    		def xml = connection.content.text
    		def geonames = new XmlSlurper().parseText(xml)
    		result.name = geonames.geoname.name as String
    		result.lat = geonames.geoname.lat as String
    		result.lng = geonames.geoname.lng as String
    		result.state = geonames.geoname.adminCode1 as String
    		result.country = geonames.geoname.countryCode as String
		} else {
			log.error("GeocoderService.geocodeAirport(${iata}) FAILED")
			log.error(url)
			log.error(connection.responseCode)
			log.error(connection.responseMessage)
		}

		return result
    }
}
