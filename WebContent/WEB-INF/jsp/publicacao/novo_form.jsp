<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<form method="post" action="/SIGP/publicacao/cria">
	<table>
		<tr>
			<td><fmt:message key="publicacao.titulo" /></td>
			<td><input type="text" name="publicacao.titulo" /></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.veiculo" /></td>
			<td><select name="publicacao.veiculo">
					<c:forEach items="${veiculos}" var="veiculo">
						<option value="${veiculo}">${veiculo}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.data" /></td>
			<td><input type="text" name="publicacao.data" /></td>
		</tr>
		
		<tr>
			<td><fmt:message key="publicacao.selecionar_projetos" /></td>
			<td><select name="idsProjetos[]" size="4" multiple>
					<option value="0"><fmt:message key="publicacao.nenhum" /></option>
					<c:forEach items="${todosprojetos}" var="projeto">
						<option value="${projeto.idProjeto}">${projeto.nome}</option>
					</c:forEach>
			</select></td>
		</tr>		
		
		<tr>
			<td colspan="2"><input type="submit" value="Criar" /></td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %>

<p>
	<a href="/SIGP/publicacao/"><fmt:message key="voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
