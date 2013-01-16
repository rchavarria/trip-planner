package trip.planner

import grails.test.mixin.*
import org.junit.*
import java.text.SimpleDateFormat

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(HotelStay)
class HotelStayTests {

	void testToString() {
		def h = new HotelStay(hotel: "Hilton")
		def df = new SimpleDateFormat("MM/dd/yyyy")
		h.checkIn = df.parse("01/14/2013")
		h.checkOut = df.parse("01/17/2013")

		assert h.toString() == "Hilton (lunes a jueves)"
	}

	void testBlankHotel() {
		def h = new HotelStay(hotel: "")
		assert !h.validate()
		assert h.hasErrors()

		def badField = h.errors.getFieldError('hotel')
		assert badField != null

		def code = badField.codes.find { it == "hotelStay.hotel.blank" }
		assert code != null
	}

	void testCheckOutIsNotBeforeCheckIn() {
		def h = new HotelStay(hotel: "Radisson")
		def df = new SimpleDateFormat("MM/dd/yyyy")
		h.checkIn = df.parse("10/15/2008")
		h.checkOut = df.parse("10/10/2008")

		assert !h.validate()
		
		def badField = h.errors.getFieldError('checkOut')
		assert badField != null

		def code = badField.codes.find { it == "hotelStay.checkOut.validator.invalid" }
		assert code != null
	}
}
