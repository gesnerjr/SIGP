<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<form method="post" action="/SIGP/linhadepesquisa/inserir">
	<table>
		<tr>
			<td><fmt:message key="linha.nome" /></td>
			<td><input type="text" name="linhapesquisa.nome" />
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td>Sublinha de Pesquisa</td> -->
<!-- 			<td><select name="linhapesquisa.subLinha"> -->
<!-- 					<option value="0">Nenhum</option> -->
<%-- 					<c:forEach items="${linhasdepesquisa}" var="linhapesquisa"> --%>
<%-- 						<option value="${linhapesquisa.idPesquisa}">${linhapesquisa.nome}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 			</select> -->
<!-- 			</td> -->
<!-- 		</tr> -->

		<tr>
			<td><fmt:message key="linha.sublinha" /></td>
<!-- 			<td><select name="linhapesquisa.subLinha.idPesquisa"> -->
			<td><select name="subLinhaidPesquisa">
					<option value="null">Nenhum</option>
					<c:forEach items="${linhasdepesquisa}" var="linhaslista">
						<c:if test="${linhaslista.idPesquisa != linhapesquisa.idPesquisa}">
							<option value="${linhaslista.idPesquisa}"
								<c:if test="${linhapesquisa.subLinha.idPesquisa == linhaslista.idPesquisa}">selected="selected"</c:if>>${linhaslista.nome}</option>
						</c:if>
					</c:forEach>
			</select>
			</td>
		</tr>

		<tr>

			<td><fmt:message key="linha.selecionar_projetos" /></td>
			<td><select name="idsProjetos[]" size="4" multiple>
					<option value="0">Nenhum</option>
					<c:forEach items="${todosprojetos}" var="projeto">
						<option value="${projeto.idProjeto}">${projeto.nome}</option>
					</c:forEach>
			</select></td>
		</tr>


		<tr>
			<td colspan="2"><input type="submit" value="Criar" />
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
