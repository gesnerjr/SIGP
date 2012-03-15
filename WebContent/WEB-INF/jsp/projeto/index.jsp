<%@ include file="/header.jsp" %> 

   	<c:choose>
		<c:when test="${userIsLogged}">
    		<div id="side-contents">
    			<fmt:message key="misc.acoes"></fmt:message>
    			<hr />
				<a href="novo"><fmt:message key="novo" /></a>
    		</div>
   		</c:when>
   		<c:otherwise>
   			<div id="side-contents" class="hidden"></div>
   		</c:otherwise>
	</c:choose>
    
    <div id="contents">
        <h2 class="top">Projetos</h2>

	<c:forEach items="${projetos}" var="projeto">
		<h3><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a></h3>
		<p>${projeto.descricao}</p>
	</c:forEach>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
