<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<table>
	<tr>
		<th><fmt:message key="contribuinte.nome" /></th>
		<th><fmt:message key="contribuinte.loginusuario" /></th>
	</tr>
	<c:forEach items="${contribuintes}" var="contrib">
		<tr>
			<td><a href="/SIGP/contribuinte/ver/${contrib.idContribuinte}">${contrib.nome}</a></td>
 			<td>${contrib.usuario.login}</td>
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
