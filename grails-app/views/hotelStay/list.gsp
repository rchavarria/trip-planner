
<%@ page import="trip.planner.HotelStay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotelStay.label', default: 'HotelStay')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hotelStay" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hotelStay" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="hotel" title="${message(code: 'hotelStay.hotel.label', default: 'Hotel')}" />
					
						<g:sortableColumn property="checkIn" title="${message(code: 'hotelStay.checkIn.label', default: 'Check In')}" />
					
						<g:sortableColumn property="checkOut" title="${message(code: 'hotelStay.checkOut.label', default: 'Check Out')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hotelStayInstanceList}" status="i" var="hotelStayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hotelStayInstance.id}">${fieldValue(bean: hotelStayInstance, field: "hotel")}</g:link></td>
					
						<td>
							<g:customDateFormat>${hotelStayInstance.checkIn}</g:customDateFormat>
						</td>
					
						<td><g:formatDate date="${hotelStayInstance.checkOut}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hotelStayInstanceTotal}" />
			</div>
		</div>
		<g:render template="/footer" />
	</body>
</html>
