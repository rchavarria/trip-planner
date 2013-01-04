package trip.planner

class Flight {

	String flightNumber

	Date departureDate
	Airport airport

	Date arrivalDate
	Airport arrivalAirport

	static belongsTo = [trip: Trip, airline: Airline]
}
