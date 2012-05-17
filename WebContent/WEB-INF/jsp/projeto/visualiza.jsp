<%@ include file="/header.jsp" %> 

   	<c:choose>
		<c:when test="${userIsLogged}">
    		<div id="side-contents">
    			<fmt:message key="misc.acoes"></fmt:message>
    			<hr />
   				<a href="projeto/alterar/${projeto.idProjeto}">Alterar</a><br />
				<a href="projeto/apagar/${projeto.idProjeto}">Apagar</a><br />
	    		</div>
   		</c:when>
   		<c:otherwise>
   			<div id="side-contents" class="hidden"></div>
  		</c:otherwise>
	</c:choose>
    
    
    <div id="contents">
        <h2 class="top">${projeto.nome}</h2>

<p>
	<b><fmt:message key="projeto.descricao" /></b> <br /> ${projeto.descricao}
</p>

<p>
	<b><fmt:message key="projeto.site" /></b> <br /> <a href="${projeto.site}">${projeto.site}</a>
</p>

<p>
	<b><fmt:message key="projeto.financiamento" /></b> <br /> ${projeto.financiamento}
</p>

<!-- Coordenadores -->
<c:if test="${!empty projeto.coordenadores}">
<p>
    <b><fmt:message key="projeto.coordenadores" /></b>
    <ul>
    <c:forEach items="${projeto.coordenadores}" var="c">
        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
    </c:forEach>
    </ul>
</c:if>

<!-- Membros -->
<c:if test="${!empty projeto.membros}">
<p>
    <b><fmt:message key="projeto.membros" /></b>
    <ul>
    <c:forEach items="${projeto.membros}" var="c">
        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
    </c:forEach>
    </ul>
</c:if>


<!-- LinhaPesquisa -->
<c:if test="${!empty projeto.linhasDePesquisa}">
<p>
	<b><fmt:message key="projeto.linhas_de_pesquisa" /></b>
	<ul>
	<c:forEach items="${projeto.linhasDePesquisa}" var="linha">
		 <li><a href="<c:url value='/linhadepesquisa/ver/${linha.idPesquisa}'></c:url>">${linha.nome}</a></li>
	</c:forEach>
	</ul>
</c:if>	

<!-- Publicacoes -->
<c:if test="${!empty projeto.publicacoes}">
<p>
	<b><fmt:message key="projeto.publicacoes" /></b>
	<ul>
	<c:forEach items="${projeto.publicacoes}" var="publicacao">
		<li><a href="<c:url value='/publicacao/ver/${publicacao.idPublicacao}'></c:url>">${publicacao.titulo}</a></li>
	</c:forEach>
	</ul>
</p>
</c:if>
        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
