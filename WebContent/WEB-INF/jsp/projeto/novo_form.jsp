<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.projetos" />: <fmt:message key="inserir" /></h2>



<form method="post" action="/SIGP/projeto/cria">
	<table>
		<tr>
			<td><fmt:message key="projeto.nome" /></td>
			<td><input type="text" name="projeto.nome" style="width:435px;"/></td>
		</tr>
		
		<tr>
			<td><fmt:message key="projeto.site" /></td>
			<td><input type="text" name="projeto.site" style="width:435px;"/></td>
		</tr>
		
		<tr>
			<td><fmt:message key="projeto.descricaoCurta" /></td>
			<td><textarea name="projeto.descricaoCurta" rows="5" cols="60"></textarea></td>
		</tr>
		
		<tr>
			<td><fmt:message key="projeto.descricao" /></td>
			<td><textarea name="projeto.descricao" rows="5" cols="60"></textarea></td>
		</tr>
		
		<tr>
			<td><fmt:message key="projeto.financiamento" /></td>
			<td><input type="text" name="projeto.financiamento" style="width:435px;" /></td>
		</tr>

			
		<tr>
			<td colspan="2"><input type="submit" value="<fmt:message key="inserir" />" /></td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 
        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
