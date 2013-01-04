package trip.planner

class Trip {
	static hasMany = [flights: Flight]
	String name
}
