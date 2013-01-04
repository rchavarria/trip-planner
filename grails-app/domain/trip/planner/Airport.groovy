package trip.planner

class Airport {

	static hasMany = [flights: Flight]
	
	String name
	String iata
	String city
	String state
	String country
}
