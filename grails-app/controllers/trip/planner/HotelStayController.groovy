package trip.planner

class HotelStayController {

    def scaffold = HotelStay

    def near = {
    	def addr = "http://local.yahooapis.com/LocalSearchService/V3/localSearch?"
    	
    	def qs = []
    	qs << "appid=YahooDemo"
    	qs << "query=hotel"
    	qs << "sort=distance"
    	qs << "output=json"
    	qs << "latitude=${params.lat}"
    	qs << "longitude=${params.lng}"

    	def url = new URL(addr + qs.join("&"))

    	render(contentType: "application/json", text: "${url.text}")
    }
}
