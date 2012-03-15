<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden"></div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.linhaspesquisa"></fmt:message>: Inserir nova</h2>


<form method="post" action="/SIGP/linhadepesquisa/inserir">
	<table>
		<tr>
			<td><fmt:message key="linha.nome" /></td>
			<td><input type="text" name="linhapesquisa.nome" style="width:435px;" />
			</td>
		</tr>

		<tr>
			<td><fmt:message key="linha.descricao" /></td>
			<td><textarea name="linhapesquisa.descricao" rows="5" cols="60"></textarea></td>
		</tr>

		<tr>
			<td><fmt:message key="linha.linhapai" /></td>
			<td><select name="idsLinhasPai[]" size="4" multiple style="width:440px;" >
					<option value="0">Nenhum</option>
					<c:forEach items="${linhasdepesquisa}" var="linhaslista">
						<c:if test="${linhaslista.idPesquisa != linhapesquisa.idPesquisa}">
							<option value="${linhaslista.idPesquisa}">
								<!-- <c:if test="${linhapesquisa.subLinha.idPesquisa == linhaslista.idPesquisa}">selected="selected"</c:if> -->
								${linhaslista.nome}</option>
						</c:if>
					</c:forEach>
			</select>
			</td>
		</tr>

		<tr>

			<td><fmt:message key="linha.selecionar_projetos" /></td>
			<td><select name="idsProjetos[]" size="4" multiple style="width:440px;" >
					<option value="0">Nenhum</option>
					<c:forEach items="${todosprojetos}" var="projeto">
						<option value="${projeto.idProjeto}">${projeto.nome}</option>
					</c:forEach>
			</select></td>
		</tr>


		<tr>
			<td colspan="2" align="right"><input type="submit" value="Criar" />
			</td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 

<p>
	<a href="/SIGP/linhadepesquisa/"><fmt:message key="voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
