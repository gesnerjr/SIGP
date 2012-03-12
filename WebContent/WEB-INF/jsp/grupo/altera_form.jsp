<%@ include file="/header.jsp" %>

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${grupo.nome}</h2>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
	$("#responsavelBusca").autocomplete({
		minLength: 1, // Precisa digitar pelo menos 1 letra para o autocompletar começar. 
		source: function( request, response ) {
			$.ajax({
				url: "../procura/" + request.term,
				dataType: "json",
				success: function( data ) {
					// response é uma função que se passar uma lista de structs com campos id e value, 
					// cria o autocompletar. 
					response($.map(data.list, function(item) {
						return { id: item.idGrupo, 
								 value: item.nome };
					}));
				}
			});
		}
	});
});
</script>

<form method="post" action="/SIGP/grupo/altera">
	<table>
		<tr>
			<td><fmt:message key="grupo.nome" /></td>
			<td><input type="text" name="grupo.nome" value="${grupo.nome}" >
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
						<option value="${contribuinte.idContribuinte}" 
						<c:if test="${contribuinte.idContribuinte == grupo.responsavel.idContribuinte}">
							selected="selected"</c:if>
						>${contribuinte.nome}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="grupo.idGrupo" value="${grupo.idGrupo}">
				<input type="submit" value="Alterar">
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
