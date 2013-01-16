package trip.planner

import java.text.SimpleDateFormat

class HotelStay {

	String hotel
	Date checkIn
	Date checkOut

    String toString() {
    	def sdf = new SimpleDateFormat("EEEE")
    	"${hotel} (${sdf.format(checkIn)} a ${sdf.format(checkOut)})"
    }

    static constraints = {
    	hotel(blank: false)
    	checkIn()
    	checkOut(validator: { val, obj -> val.after(obj.checkIn) })
    }
}
