<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<table>
	<tr>		
		<th><fmt:message key="linha.nome" /></th>
	</tr>
	<c:forEach items="${linhasdepesquisa}" var="linhapesquisa">
		<tr>
			<td><a href="/SIGP/linhadepesquisa/ver/${linhapesquisa.idPesquisa}">${linhapesquisa.nome}</a></td>
			<td>${linhapesquisa.nome}</td>
		</tr>
	</c:forEach>
</table>
<p>
	<a href="/SIGP/linhadepesquisa/novo">Novo</a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
