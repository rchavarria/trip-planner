<%@ page import="trip.planner.Flight" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<g:javascript library="prototype" />
		<script type="text/javascript">
			function get(airportField) {
				var baseUrl = "${createLink(controller:'airport', action:'getJson')}";
				var url = baseUrl + "?iata=" + $F(airportField + "Iata");
				new Ajax.Request(url, {
					method: 'get',
					asynchronous: true,
					onSuccess: function(req) { update(req.responseText, airportField) }
				});
			};

			function update(json, airportField) {
				var airport = eval( "(" + json + ")" );
				var output = $(airportField + "Text");
				output.innerHTML = airport.iata + " - " + airport.name;
				var hiddenField = $(airportField + ".id");
				airport.id == null ? hiddenField.value = -1 : hiddenField.value = airport.id;
			};

			function validate() {
				if( $F("airport.id") == -1) {
					alert("Please, supply a valid Departure Airport");
					return false;
				}

				if( $F("arrivalAirport.id") == -1) {
					alert("Please, supply a valid Arrival Airport");
					return false;
				}

				return true;
			}
		</script>

	</head>
	<body>
		<a href="#create-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-flight" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${flightInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${flightInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" onsubmit="return validate()">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
