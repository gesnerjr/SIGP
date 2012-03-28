<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>

<c:forEach items="${publicacoes}" var="publicacao">
	<div class="publicacao">
	    <strong>"<a href='<c:url value="/publicacao/ver/${publicacao.idPublicacao}"/>'>${publicacao.titulo}</a>"</strong><br />
    </div>
</c:forEach>
