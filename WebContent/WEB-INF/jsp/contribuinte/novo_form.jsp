<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.contribuintes"/>: <fmt:message key="inserir"/></h2>



<form method="post" action="/SIGP/contribuinte/cria" enctype="multipart/form-data">
	<table>
		<tr>
			<td><fmt:message key="contribuinte.nome" /></td>
			<td><input type="text" name="contribuinte.nome" /></td>
		</tr>
		
		<tr>
			<td><fmt:message key="contribuinte.nomecitacao" /></td>
			<td><input type="text" name="contribuinte.nomeCitacao" /></td>
		</tr>

		<tr>
			<td><fmt:message key="contribuinte.usuariocorrespondente" /></td>
			<td><select name="idUsuario">
					<option value="0"><fmt:message key="contribuinte.nenhum" /></option>
					<c:forEach items="${usuarios}" var="usuario">
						<option value="${usuario.idUsuario}">${usuario.login}</option>
					</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td><fmt:message key="contribuinte.foto" /></td>
			<td><input type="file" name="file"/></td>
		</tr>
						
		<tr>
			<td colspan="2"><input type="submit" value="Criar" /></td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 

        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
