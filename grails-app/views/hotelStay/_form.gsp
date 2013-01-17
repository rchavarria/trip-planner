<%@ page import="trip.planner.HotelStay" %>



<div class="fieldcontain ${hasErrors(bean: hotelStayInstance, field: 'hotel', 'error')} required">
	<label for="hotel">
		<g:message code="hotelStay.hotel.label" default="Hotel" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hotel" required="" value="${hotelStayInstance?.hotel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotelStayInstance, field: 'checkIn', 'error')} required">
	<label for="checkIn">
		<g:message code="hotelStay.checkIn.label" default="Check In" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkIn" precision="day"  value="${hotelStayInstance?.checkIn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: hotelStayInstance, field: 'checkOut', 'error')} required">
	<label for="checkOut">
		<g:message code="hotelStay.checkOut.label" default="Check Out" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="checkOut" precision="day"  value="${hotelStayInstance?.checkOut}"  />
</div>

