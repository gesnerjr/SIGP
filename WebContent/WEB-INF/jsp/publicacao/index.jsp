<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<table>
	<tr>
		<th><fmt:message key="publicacao.titulo" /></th>
		<th><fmt:message key="publicacao.data" /></th>
		<th><fmt:message key="publicacao.veiculo" /></th>
	</tr>
	<c:forEach items="${publicacoes}" var="publicacao">
		<tr>
			<td><a href="/SIGP/publicacao/ver/${publicacao.idPublicacao}">${publicacao.titulo}</a></td>
<%-- 			<td>${publicacao.data}</td> --%>
<%-- 			<td>${publicacao.veiculo}</td> --%>
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
