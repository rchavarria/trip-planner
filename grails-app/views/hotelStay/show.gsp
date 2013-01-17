
<%@ page import="trip.planner.HotelStay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotelStay.label', default: 'HotelStay')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hotelStay" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hotelStay" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hotelStay">
			
				<g:if test="${hotelStayInstance?.hotel}">
				<li class="fieldcontain">
					<span id="hotel-label" class="property-label"><g:message code="hotelStay.hotel.label" default="Hotel" /></span>
					
						<span class="property-value" aria-labelledby="hotel-label"><g:fieldValue bean="${hotelStayInstance}" field="hotel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelStayInstance?.checkIn}">
				<li class="fieldcontain">
					<span id="checkIn-label" class="property-label"><g:message code="hotelStay.checkIn.label" default="Check In" /></span>
					
						<span class="property-value" aria-labelledby="checkIn-label"><g:formatDate date="${hotelStayInstance?.checkIn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelStayInstance?.checkOut}">
				<li class="fieldcontain">
					<span id="checkOut-label" class="property-label"><g:message code="hotelStay.checkOut.label" default="Check Out" /></span>
					
						<span class="property-value" aria-labelledby="checkOut-label"><g:formatDate date="${hotelStayInstance?.checkOut}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hotelStayInstance?.id}" />
					<g:link class="edit" action="edit" id="${hotelStayInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
