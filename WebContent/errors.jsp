<c:if test="${!empty errors}">
<div class="red-info info-box sigp">
	<h4>Error!</h4>
	<c:forEach var="error" items="${errors}"><p>${error.category}: ${error.message}</p></c:forEach>
</div>
</c:if>