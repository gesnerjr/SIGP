<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<table>
	<tr>
		<th><fmt:message key="projeto.nome" /></th>
		<th><fmt:message key="projeto.financiamento" /></th>
		<th><fmt:message key="projeto.descricao" /></th>
	</tr>
	<c:forEach items="${projetos}" var="projeto">
		<tr>
			<td><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a></td>
			<td>${projeto.financiamento}</td>
			<td>${projeto.descricao}</td>
		</tr>
	</c:forEach>
</table>
<p>
	<a href="novo"><fmt:message key="novo" /></a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
