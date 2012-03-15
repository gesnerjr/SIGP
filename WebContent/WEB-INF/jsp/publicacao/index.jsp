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
        <h2 class="top"><fmt:message key="header.publicacoes" /></h2>

<ul>
	<c:forEach items="${publicacoes}" var="publicacao">
		<li>
		    <strong>"<a href="/SIGP/publicacao/ver/${publicacao.idPublicacao}">${publicacao.titulo}</a>"</strong>
	    </li>
	</c:forEach>
</ul>


<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
