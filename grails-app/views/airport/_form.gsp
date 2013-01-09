<%@ page import="trip.planner.Airport" %>



<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="airport.name.label" default="Name" />
		
	</label>
	${airportInstance?.name}
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'iata', 'error')} ">
	<label for="iata">
		<g:message code="airport.iata.label" default="Iata" />
		
	</label>
	<g:textField name="iata" maxlength="3" value="${airportInstance?.iata}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="airport.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${airportInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="airport.state.label" default="State" />
		
	</label>
	${airportInstance?.state}
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="airport.country.label" default="Country" />
		
	</label>
	${airportInstance?.country}
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="airport.lat.label" default="Lat" />
		
	</label>
	${airportInstance?.lat}
</div>

<div class="fieldcontain ${hasErrors(bean: airportInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="airport.lng.label" default="Lng" />
		
	</label>
	${airportInstance?.lng}
</div>

