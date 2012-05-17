<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.projetos" />: <fmt:message key="inserir" /></h2>



<form method="post" action="<c:url value='/projeto/cria'></c:url>">
	<table>
		<tr>
			<td><fmt:message key="projeto.nome" /></td>
			<td><input type="text" name="projeto.nome"/></td>
		</tr>
		
		<tr>
			<td><fmt:message key="projeto.site" /></td>
			<td><input type="text" name="projeto.site"/></td>
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
            <td><fmt:message key="projeto.coordenadores" /></td>
            <td>
                <input id="coordinput" type="text">
                <select id="selectcoord" name="idsCoordenadores[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>
        
        <tr>
            <td><fmt:message key="projeto.membros" /></td>
            <td>
                <input id="memberinput" type="text">
                <select id="selectmember" name="idsMembros[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>
        
        <tr>
            <td><fmt:message key="projeto.linhas" /></td>
            <td>
                <input id="linesinput" type="text">
                <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>
		
		<tr>
			<td><fmt:message key="projeto.financiamento" /></td>
			<td><input type="text" name="projeto.financiamento"/></td>
		</tr>

			
		<tr>
			<td colspan="2"><input type="submit" value="<fmt:message key="inserir" />" /></td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 
        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
