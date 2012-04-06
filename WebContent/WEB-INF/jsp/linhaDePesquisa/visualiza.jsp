<%@ include file="/header.jsp" %> 

	<c:choose>
		<c:when test="${userIsLogged}">
    		<div id="side-contents">
    			<fmt:message key="misc.acoes"></fmt:message>
    			<hr />
				<a href="/SIGP/linhadepesquisa/alterar/${linhapesquisa.idPesquisa}"><fmt:message key="alterar" /></a><br />
				<a href="/SIGP/linhadepesquisa/apagar/${linhapesquisa.idPesquisa}"><fmt:message key="apagar" /></a>
    		</div>
   		</c:when>
   		<c:otherwise>
   			<div id="side-contents" class="hidden"></div>
   		</c:otherwise>
	</c:choose>
    
    <div id="contents">
        <h2 class="top">${linhapesquisa.nome}</h2>
<p>
	<b>Descrição:</b><br />
	${linhapesquisa.descricao}
</p>
<p>
	<b>Linhas de Origem:</b>
	<c:choose>
		<c:when test="${linhapesquisa.linhasPai != null}">
			<c:forEach items="${linhapesquisa.linhasPai}" var="lpai">${lpai.nome}, </c:forEach>
		</c:when>
		<c:otherwise> nenhuma </c:otherwise>
	</c:choose>
</p>
<p>
	<b>Linhas Filhas:</b>
	<c:choose>
		<c:when test="${linhapesquisa.linhasFilhas != null}">
			<c:forEach items="${linhapesquisa.linhasFilhas}" var="lpai">${lpai.nome}, </c:forEach>
		</c:when>
		<c:otherwise> nenhuma </c:otherwise>
	</c:choose>
</p>
<p><b>Projetos:</b></p>
<ul>
	<c:forEach items="${linhapesquisa.projetos}" var="projeto">
		<li><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a>
		</li>
	</c:forEach>
</ul>
<!-- <p>Contribuintes:</p> -->
<%-- <ul><c:forEach items="${linhapesquisa.contribuintes}" var="contribuinte"> --%>
<%-- 	<li><a href="/SIGP/contribuinte/ver/${contribuinte.idContribuinte}">${contribuinte.nome}</a></li> --%>
<%-- </c:forEach></ul> --%>

    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
