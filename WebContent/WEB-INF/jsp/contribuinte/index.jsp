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
        <h2 class="top">Contribuintes</h2>

		<ul>
			<c:forEach items="${contribuintes}" var="contrib">
				<li><a href="/SIGP/contribuinte/ver/${contrib.idContribuinte}">${contrib.nome}</a>
		 			(${contrib.nomeCitacao})</li>
			</c:forEach>
		</ul>
		
		
	<hr />
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
