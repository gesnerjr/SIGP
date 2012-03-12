<%@ include file="/header.jsp" %>

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${grupo.nome}</h2>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form method="post" action="/SIGP/projeto/cria_participacao">
	<table>
		<tr>
			<td><fmt:message key="participacao.contribuinte" /></td>
			<td><select name="idContribuinte">
					<c:forEach items="${todoscontribuintes}" var="contribuinte">
						<option value="${contribuinte.idContribuinte}">${contribuinte.nome}</option>
					</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td><fmt:message key="participacao.inicio" /></td>
			<td>
				<input type="text" name="participacao.dataInicio">
			</td>
		</tr>
		
		<tr>
			<td><fmt:message key="participacao.fim" /></td>
			<td>
				<input type="text" name="participacao.dataFim">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="hidden" name="idProjeto" value="${projeto.idProjeto}">
				<input type="submit" value="Adicionar Participação">
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
