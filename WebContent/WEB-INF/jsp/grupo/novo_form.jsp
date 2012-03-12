<%@ include file="/header.jsp" %>

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Adicionar novo Grupo</h2>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<form method="post" action="/SIGP/grupo/cria">
	<table>
		<tr>
			<td><fmt:message key="grupo.nome" /></td>
			<td><input type="text" name="grupo.nome" />
			</td>
		</tr>
		<tr>
			<td><fmt:message key="grupo.responsavel" /></td>
			<%-- 
			<td>
				<input type="text" id="responsavelBusca" name="responsavel" />
			</td>
			--%>
			<td><select name="idResponsavel">
					<option value="0"><fmt:message key="grupo.nenhum" /></option>
					<c:forEach items="${todoscontribuintes}" var="contribuinte">
						<option value="${contribuinte.idContribuinte}">${contribuinte.nome}</option>
					</c:forEach>
			</select></td>
		</tr>
		
		<tr>


			<td><fmt:message key="grupo.selecionar_linhas_de_pesquisa" />
			<td><select name="idsLinhasdePesquisa[]" size="4" multiple>
					<option value="0"><fmt:message key="grupo.nenhum" /></option>
					<c:forEach items="${todaslinhasdepesquisa}" var="linha">
						<option value="${linha.idPesquisa}">${linha.nome}</option>
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
	<a href="/SIGP/grupo/"><fmt:message key="voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
