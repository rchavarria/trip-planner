
<%@ page import="trip.planner.Airport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'airport.label', default: 'Airport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-airport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-airport" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list airport">
			
				<g:if test="${airportInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="airport.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${airportInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.iata}">
				<li class="fieldcontain">
					<span id="iata-label" class="property-label"><g:message code="airport.iata.label" default="Iata" /></span>
					
						<span class="property-value" aria-labelledby="iata-label"><g:fieldValue bean="${airportInstance}" field="iata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="airport.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${airportInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="airport.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${airportInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="airport.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${airportInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.lat}">
				<li class="fieldcontain">
					<span id="lat-label" class="property-label"><g:message code="airport.lat.label" default="Lat" /></span>
					
						<span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${airportInstance}" field="lat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airportInstance?.lng}">
				<li class="fieldcontain">
					<span id="lng-label" class="property-label"><g:message code="airport.lng.label" default="Lng" /></span>
					
						<span class="property-value" aria-labelledby="lng-label"><g:fieldValue bean="${airportInstance}" field="lng"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${airportInstance?.id}" />
					<g:link class="edit" action="edit" id="${airportInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
