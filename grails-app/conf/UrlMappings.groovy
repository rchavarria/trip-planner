class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/rest/airport/$iata?"(controller: "airport", action: "index")
		
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
