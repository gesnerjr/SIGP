<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Contribuintes</h2>

		<ul>
			<c:forEach items="${contribuintes}" var="contrib">
				<li><a href="/SIGP/contribuinte/ver/${contrib.idContribuinte}">${contrib.nome}</a>
		 			(${contrib.nomeCitacao})</li>
			</c:forEach>
		</ul>
		
		
		<p>
			<a href="novo"><fmt:message key="novo" /></a>
		</p>
		
		<hr />
	
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
