<%@ include file="/header.jsp" %> 

<table>
	<tr>
		<th>Nome</th>
		<th>Responsável</th>
		<th colspan="2">&nbsp;</th>
	</tr>
	<c:forEach items="${grupos}" var="grupo">
		<tr>
			<td><a href="/SIGP/grupo/ver/${grupo.idGrupo}">${grupo.nome}</a></td>
			<td><c:choose>
					<c:when test="${grupo.responsavel != null}">${grupo.responsavel.nome}</c:when>
					<c:otherwise> - </c:otherwise>
				</c:choose></td>
			<td><a href="/SIGP/grupo/alterar/${grupo.idGrupo}">Alterar</a></td>
			<td><a href="/SIGP/grupo/apagar/${grupo.idGrupo}">Apagar</a></td>
		</tr>
	</c:forEach>
</table>
<p>
	<a href="novo">Novo</a>
</p>
<p>
	<a href="/SIGP">Voltar para Pagina Principal</a>
</p>

<%@ include file="/footer.jsp" %> 
