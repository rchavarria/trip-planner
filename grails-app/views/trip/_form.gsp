<%@ page import="trip.planner.Trip" %>



<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'flights', 'error')} ">
	<label for="flights">
		<g:message code="trip.flights.label" default="Flights" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tripInstance?.flights?}" var="f">
    <li><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flight" action="create" params="['trip.id': tripInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flight.label', default: 'Flight')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="trip.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tripInstance?.name}"/>
</div>

