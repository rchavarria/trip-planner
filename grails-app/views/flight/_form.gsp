<%@ page import="trip.planner.Flight" %>



<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'airline', 'error')} required">
	<label for="airline">
		<g:message code="flight.airline.label" default="Airline" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="airline" name="airline.id" from="${trip.planner.Airline.listOrderByName()}" optionKey="id" required="" value="${flightInstance?.airline?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'airport', 'error')} required">
	<label for="airport">
		<g:message code="flight.airport.label" default="Airport" />
		<span class="required-indicator">*</span>
	</label>

	<div id="airportText">[Type an Airport IATA code]</div>
	<input type="hidden" name="airport.id" value="-1" id="airport.id" />
	<input type="text" name="airportIata" id="airportIata" />
	<input type="button" value="Find" onClick="get('airport')" />

	<!--
	<g:select id="airport" 
			  name="airport.id" 
			  from="${trip.planner.Airport.list()}" 
			  optionKey="id" 
			  required="" 
			  value="${flightInstance?.airport?.id}" 
			  class="many-to-one"/>
	-->
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalAirport', 'error')} required">
	<label for="arrivalAirport">
		<g:message code="flight.arrivalAirport.label" default="Arrival Airport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arrivalAirport" name="arrivalAirport.id" from="${trip.planner.Airport.list()}" optionKey="id" required="" value="${flightInstance?.arrivalAirport?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="flight.arrivalDate.label" default="Arrival Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="arrivalDate" precision="day"  value="${flightInstance?.arrivalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureDate', 'error')} required">
	<label for="departureDate">
		<g:message code="flight.departureDate.label" default="Departure Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="departureDate" precision="day"  value="${flightInstance?.departureDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'flightNumber', 'error')} ">
	<label for="flightNumber">
		<g:message code="flight.flightNumber.label" default="Flight Number" />
		
	</label>
	<g:textField name="flightNumber" value="${flightInstance?.flightNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'trip', 'error')} required">
	<label for="trip">
		<g:message code="flight.trip.label" default="Trip" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="trip" name="trip.id" from="${trip.planner.Trip.list()}" optionKey="id" required="" value="${flightInstance?.trip?.id}" class="many-to-one"/>
</div>

