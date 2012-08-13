<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>

<ul id="yearsList">
	<li class="off"><div class="menuTitle">By year</div></li>
	<c:forEach items="${years}" var="y">
	    <li><a href="<c:url value='/publicacao/by-year/${y.value}'/>">${y.key} (${y.value})</a></li>
	</c:forEach>
</ul>

<%-- 
<ul id="mostCited">
	<li class="off"><div class="menuTitle">By citation</div></li>
	<c:if test="#{mbShowPublications.consultaCitacoes}">
		<li class="active">#{msgs.publicationCitationOption}</li>
	</c:if>
	<c:if test="#{!mbShowPublications.consultaCitacoes}">
		<li><a href="publications.jsf?p1=citations">#{msgs.publicationCitationOption}</a></li>
	</c:if>
</ul>
--%>

<ul id="languageList">
	<li class="off"><div class="menuTitle">By language</div></li>
	<li>English</li>
	<li>Português</li>
</ul>

<ul id="tipoPulicacaoList">
	<li class="off"><div class="menuTitle">By publication type</div></li>
	<c:forEach items="${veiculos}" var="veiculo">
        <li><a href="">${veiculo.tipoVeiculo}</a></li>
    </c:forEach>
</ul>

<%--
<c:if test="${userIsLogged}">
	<ul id="estadoPulicacaoList">
		<li class="off"><div class="menuTitle">By Status</div></li>
		<c:forEach begin="0"
			items="${mbShowPublications.publicationStatusList}" var="estado">
			<c:if test="${estado == mbShowPublications.currentStatus}">
				<li class="active">${estado}
					(${mbShowPublications.qtdPublicationsByStatus(estado)})</li>
			</c:if>
			<c:if test="${estado != mbShowPublications.currentStatus}">
				<li><a href="publications.jsf?p1=status-${estado}">${estado}
						(${mbShowPublications.qtdPublicationsByStatus(estado)})</a></li>
			</c:if>
		</c:forEach>
	</ul>
</c:if>            
 --%>

<ul>
    <li class="off"><div class="menuTitle">By Research Line</div></li>
    <li>select box here</li>
</ul> 
 
<ul>
    <li class="off"><div class="menuTitle">By Research Method</div></li>
    <li>...</li>
    <li>...</li>
</ul>


<ul>
    <li class="off"><div class="menuTitle">By project</div></li>
    <li>...</li>
    <li>...</li>
</ul>
