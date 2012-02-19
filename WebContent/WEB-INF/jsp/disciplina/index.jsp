<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<table>
	<tr>
		<th><fmt:message key="disciplina.sigla" /></th>
		<th><fmt:message key="disciplina.nome" /></th>
	</tr>
	<c:forEach items="${disciplinas}" var="disciplina">
		<tr>
			<td><a href="/SIGP/disciplina/ver/${disciplina.idDisciplina}">${disciplina.sigla}</a></td>
			<td>${disciplina.nome}</td>
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
