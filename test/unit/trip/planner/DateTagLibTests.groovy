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
}
