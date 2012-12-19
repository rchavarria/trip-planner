package trip.planner

class Trip {

	String name
	String city
	Date startDate
	Date endDate
	String purpose
	String notes

    static constraints = {
    }

    static belongsTo = [airline: Airline]
}
