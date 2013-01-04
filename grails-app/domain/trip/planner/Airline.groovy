package trip.planner

class Airline {

	String name
	String iata
	String frequentFlyer
	String notes

	static hasMany = [flights: Flight]

	String toString() {
		name
	}
}
