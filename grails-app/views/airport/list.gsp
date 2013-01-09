
<%@ page import="trip.planner.Airport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'airport.label', default: 'Airport')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-airport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-airport" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'airport.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="iata" title="${message(code: 'airport.iata.label', default: 'Iata')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'airport.city.label', default: 'City')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'airport.state.label', default: 'State')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'airport.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="lat" title="${message(code: 'airport.lat.label', default: 'Lat')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${airportInstanceList}" status="i" var="airportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${airportInstance.id}">${fieldValue(bean: airportInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: airportInstance, field: "iata")}</td>
					
						<td>${fieldValue(bean: airportInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: airportInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: airportInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: airportInstance, field: "lat")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${airportInstanceTotal}" />
			</div>
		</div>
		<g:render template="/footer" />
	</body>
</html>
