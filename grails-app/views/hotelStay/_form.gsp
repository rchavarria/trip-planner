<%@ page import="trip.planner.HotelStay" %>



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

<div class="fieldcontain ${hasErrors(bean: hotelStayInstance, field: 'hotel', 'error')} ">
	<label for="hotel">
		<g:message code="hotelStay.hotel.label" default="Hotel" />
		
	</label>
	<g:textField name="hotel" value="${hotelStayInstance?.hotel}"/>
</div>

