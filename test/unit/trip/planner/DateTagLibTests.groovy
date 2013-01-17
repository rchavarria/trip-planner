package trip.planner

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(DateTagLib)
class DateTagLibTests {

	def dateTagLib

	void setUp() {
		dateTagLib = new DateTagLib()
	}

    void testThisYear() {
        String expected = Calendar.getInstance().get(Calendar.YEAR)
        assertEquals(expected, new DateTagLib().thisYear().toString())
    }

    void testNoFormat() {
    	def output = new DateTagLib().customDateFormat(format: null, body: "2013-01-16 00:00:00.0")
    	println "\ncustomDateFormat using the default format"
    	println output

    	assert "jueves" == output
    }

    void testCustomFormat() {
    	def output = new DateTagLib().customDateFormat(format: "dd/MM/yyyy", body: "2013-01-16 00:00:00.0")
    	assert "16/01/2013" == output
    }
}
