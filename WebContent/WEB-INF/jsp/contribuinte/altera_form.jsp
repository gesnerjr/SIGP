<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${contribuinte.nome}: <fmt:message key="alterar" /></h2>



<form method="post" action="/SIGP/contribuinte/altera" enctype="multipart/form-data">
	<table>
		<tr>
			<td><fmt:message key="contribuinte.nome" /></td>
			<td><input type="text" name="contribuinte.nome" value="${contribuinte.nome}" />
			</td>
		</tr>
		
		<tr>
			<td><fmt:message key="contribuinte.nomecitacao" /></td>
			<td><input type="text" name="contribuinte.nomeCitacao" value="${contribuinte.nomeCitacao}" /></td>
		</tr>

		<tr>
			<td><fmt:message key="contribuinte.usuariocorrespondente" /></td>
			<td><select name="idUsuario">
					<option value="0"><fmt:message key = "contribuinte.nenhum" /></option>
					<c:forEach items="${usuarios}" var="usuario">
						<option value="${usuario.idUsuario}"   
						<c:if test="${usuario.idUsuario == contribuinte.usuario.idUsuario}">
							selected</c:if>
						>${usuario.login}</option>
					</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td><fmt:message key="contribuinte.foto" /></td>
			<td><input type="file" name="file"/></td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="hidden" name="contribuinte.idContribuinte"
				value="${contribuinte.idContribuinte}" /> <input type="submit" value="<fmt:message key="alterar" />" />
			</td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 

       
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
