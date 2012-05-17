<%@ include file="/header.jsp" %> 

	<c:choose>
		<c:when test="${userIsLogged}">
    		<div id="side-contents">
    			<fmt:message key="misc.acoes"></fmt:message>
    			<hr />
				<a href="edit/${software.idSoftware}"><fmt:message key="alterar" /></a><br />
				<a href="del/${software.idSoftware}"><fmt:message key="apagar" /></a>
    		</div>
   		</c:when>
   		<c:otherwise>
   			<div id="side-contents" class="hidden"></div>
   		</c:otherwise>
	</c:choose>
    
    <div id="contents">
        <h2 class="top">${software.nome}</h2>
<p>
	${software.descricao}
</p>
        
<p>
    <b><fmt:message key="software.licenca" /></b>:<br /> ${software.licenca.nomeLicenca}
</p>        

<p>
    <b><fmt:message key="software.repositorio" /></b>:
    <a href="${software.repositorio}">${software.repositorio}</a>
</p>

<p>
    <b><fmt:message key="software.liveDemo" /></b>:
    <a href="${software.liveDemo}">${software.liveDemo}</a>
</p>

<!-- Projetos -->
<c:if test="${!empty software.projetos}">
<p>
    <b><fmt:message key="software.projetos" /></b>
    <ul>
    <c:forEach items="${software.projetos}" var="p">
        <li><a href='<c:url value="/projeto/ver/${c.idProjeto}"></c:url>'>${p.nome}</a></li>
    </c:forEach>
    </ul>
</p>    
</c:if>

<!-- LinhaPesquisa -->
<c:if test="${!empty software.linhas}">
<p>
    <b><fmt:message key="software.linhas" /></b>
    <ul>
    <c:forEach items="${software.linhas}" var="linha">
        <li><a href="<c:url value='/linhadepesquisa/ver/${linha.idPesquisa}'></c:url>">${linha.nome}</a></li>
    </c:forEach>
    </ul>
</p>
</c:if> 

<!-- Membros -->
<c:if test="${!empty software.contribuintes}">
<p>
    <b><fmt:message key="software.desenvolvedores" /></b>
    <ul>
    <c:forEach items="${software.contribuintes}" var="c">
        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
    </c:forEach>
    </ul>
</p>
</c:if>

<!-- Publicacoes -->
<c:if test="${!empty software.publicacoes}">
<p>
    <b><fmt:message key="software.publicacoes" /></b>
    <ul>
    <c:forEach items="${software.publicacoes}" var="publicacao">
        <li><a href="<c:url value='/publicacao/ver/${publicacao.idPublicacao}'></c:url>">${publicacao.titulo}</a></li>
    </c:forEach>
    </ul>
</p>
</c:if>


    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
