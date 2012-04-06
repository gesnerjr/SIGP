<%@ include file="/header.jsp" %> 

	<c:choose>
		<c:when test="${userIsLogged}">
    		<div id="side-contents">
    			<fmt:message key="misc.acoes"></fmt:message>
    			<hr />
				<a href="novo"><fmt:message key="novo"/></a>
    		</div>
   		</c:when>
   		<c:otherwise>
   			<div id="side-contents" class="hidden"></div>
   		</c:otherwise>
	</c:choose>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.linhaspesquisa"></fmt:message> </h2>


	<c:forEach items="${linhasdepesquisa}" var="linhapesquisa">
		<h3><a href="/SIGP/linhadepesquisa/ver/${linhapesquisa.idPesquisa}">${linhapesquisa.nome}</a></h3>
	</c:forEach>

        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
