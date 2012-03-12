<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${publicacao.titulo}: Alterar</h2>



<form method="post" action='<c:url value="/publicacao/altera"/>' enctype="multipart/form-data">
	<table>
		<tr>
			<td><fmt:message key="publicacao.titulo" /></td>
			<td><input type="text" name="publicacao.titulo" style="width:435px;" 
				value="${publicacao.titulo}" /></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.resumo" /></td>
			<td><textarea name="publicacao.resumo" rows="5" cols="60"> ${publicacao.resumo } </textarea></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.abstract" /></td>
			<td><textarea name="publicacao.paperAbstract" rows="5" cols="60">${publicacao.paperAbstract}</textarea></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.autores" /></td>
			<td><select name="idsContribuintes[]" size="4" multiple style="width:440px;" >
					<option value="0"><fmt:message key="publicacao.nenhum" /></option>
					<c:forEach items="${todoscontribuintes}" var="contribuinte">
						<option value="${contribuinte.idContribuinte}">${contribuinte.nome}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.veiculotipo" /></td>
			<td><select name="publicacao.veiculoTipo" style="width:440px;" >
					<c:forEach items="${veiculos}" var="veiculo">
						<option value="${veiculo}"
							<c:if test="${publicacao.veiculoTipo == veiculo}">selected="selected"</c:if>>
							${veiculo.tipoVeiculo}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.veiculonome" /></td>
			<td><input type="text" name="publicacao.veiculonome" style="width:435px;" 
				value="${publicacao.veiculoNome}"/></td>
		</tr>
		
		<tr>
			<td><fmt:message key="publicacao.data" /></td>
			<td>
				<input type="text" id="month" name="month" class="monthPicker" style="width:435px;" value="${publicacao.mes + 1}/${publicacao.ano}"/>
				<input type="hidden" class="yearResult"  name="publicacao.ano" value="${publicacao.ano}" />
				<input type="hidden" class="monthResult" name="publicacao.mes" value="${publicacao.mes}" />
			</td>
		</tr>
		<tr>
			<td><fmt:message key="publicacao.selecionar_projetos" /></td>
			<td><select name="idsProjetos[]" size="4" multiple style="width:440px;" >
					<option value="0" selected><fmt:message key="publicacao.nenhum" /></option>
					<c:forEach items="${todosprojetos}" var="projeto">
						<option value="${projeto.idProjeto}">${projeto.nome}</option>
					</c:forEach>
			</select></td>
		</tr>
		
		<tr>
			<td><fmt:message key="publicacao.link" /></td>
			<td><input type="text" name="publicacao.linkEditora" style="width:435px;" />${publicacao.linkEditora}</td>
		</tr>
		
		<tr>
			<td><fmt:message key="publicacao.bibtex" /></td>
			<td><textarea name="publicacao.bibtex" rows="5" cols="60">${publicacao.bibtex}</textarea></td>
		</tr>
		
		<tr>
			<td><fmt:message key="publicacao.pdf" /></td>
			<td><input type="file" name="pdf"/></td>
		</tr>
				
		<tr>
			<td colspan="2"><input type="hidden"
				name="publicacao.idPublicacao" value="${publicacao.idPublicacao}" />
				<input type="submit" value="Alterar" /></td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %>

<p>
	<a href="/SIGP/publicacao/"><fmt:message key="voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
