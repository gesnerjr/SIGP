<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${linhapesquisa.nome}</h2>



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
	<b>Linhas de Origem:</b>
	<c:choose>
		<c:when test="${linhapesquisa.linhasFilhas != null}">
			<c:forEach items="${linhapesquisa.linhasFilhas}" var="lpai">${lpai.nome}, </c:forEach>
		</c:when>
		<c:otherwise> nenhuma </c:otherwise>
	</c:choose>
</p>
<p>Projetos:</p>
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
<p>
<a href="/SIGP/linhadepesquisa/alterar/${linhapesquisa.idPesquisa}">Alterar</a>
<a href="/SIGP/linhadepesquisa/apagar/${linhapesquisa.idPesquisa}">Apagar</a>
</p>

<hr />
<p>
	<a href="/SIGP/linhadepesquisa/"><fmt:message key="linha.voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
