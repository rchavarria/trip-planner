package trip.planner

import java.text.SimpleDateFormat

class DateTagLib {

	def thisYear = {
		out << Calendar.getInstance().get(Calendar.YEAR)
	}

	def copyright = { attrs, body ->
		out << "<div id='copyright'>"
		out << "&copy; ${attrs['startYear']} - ${thisYear()}, ${body()}"
		out << " All Rights Reserved."
		out << "</div>"
	}

	def customDateFormat = { attrs, body ->
		def b = attrs.body ?: body()
		def d = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(b.toString())

		def pattern = attrs["format"] ?: "EEEE"
		out << new SimpleDateFormat(pattern).format(d)
	}
}
