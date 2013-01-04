
<%@ page import="trip.planner.Flight" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flight" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flight">
			
				<g:if test="${flightInstance?.airline}">
				<li class="fieldcontain">
					<span id="airline-label" class="property-label"><g:message code="flight.airline.label" default="Airline" /></span>
					
						<span class="property-value" aria-labelledby="airline-label"><g:link controller="airline" action="show" id="${flightInstance?.airline?.id}">${flightInstance?.airline?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.airport}">
				<li class="fieldcontain">
					<span id="airport-label" class="property-label"><g:message code="flight.airport.label" default="Airport" /></span>
					
						<span class="property-value" aria-labelledby="airport-label"><g:link controller="airport" action="show" id="${flightInstance?.airport?.id}">${flightInstance?.airport?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.arrivalAirport}">
				<li class="fieldcontain">
					<span id="arrivalAirport-label" class="property-label"><g:message code="flight.arrivalAirport.label" default="Arrival Airport" /></span>
					
						<span class="property-value" aria-labelledby="arrivalAirport-label"><g:link controller="airport" action="show" id="${flightInstance?.arrivalAirport?.id}">${flightInstance?.arrivalAirport?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.arrivalDate}">
				<li class="fieldcontain">
					<span id="arrivalDate-label" class="property-label"><g:message code="flight.arrivalDate.label" default="Arrival Date" /></span>
					
						<span class="property-value" aria-labelledby="arrivalDate-label"><g:formatDate date="${flightInstance?.arrivalDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.departureDate}">
				<li class="fieldcontain">
					<span id="departureDate-label" class="property-label"><g:message code="flight.departureDate.label" default="Departure Date" /></span>
					
						<span class="property-value" aria-labelledby="departureDate-label"><g:formatDate date="${flightInstance?.departureDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.flightNumber}">
				<li class="fieldcontain">
					<span id="flightNumber-label" class="property-label"><g:message code="flight.flightNumber.label" default="Flight Number" /></span>
					
						<span class="property-value" aria-labelledby="flightNumber-label"><g:fieldValue bean="${flightInstance}" field="flightNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flightInstance?.trip}">
				<li class="fieldcontain">
					<span id="trip-label" class="property-label"><g:message code="flight.trip.label" default="Trip" /></span>
					
						<span class="property-value" aria-labelledby="trip-label"><g:link controller="trip" action="show" id="${flightInstance?.trip?.id}">${flightInstance?.trip?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${flightInstance?.id}" />
					<g:link class="edit" action="edit" id="${flightInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
