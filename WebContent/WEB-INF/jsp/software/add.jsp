<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden"></div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.software"></fmt:message>: <fmt:message key="inserir" /></h2>
        
<form method="post" action="<c:url value='/software/update'></c:url>">
	<table>
		<tr>
			<td><fmt:message key="software.nome" /></td>
			<td><input type="text" name="software.nome" />
			</td>
		</tr>

		<tr>
			<td><fmt:message key="software.descricao" /></td>
			<td><textarea name="software.descricao" rows="5" cols="60"></textarea></td>
		</tr>
		
		<tr>
            <td><fmt:message key="software.licenca" /></td>
            <td>
                <select name="software.licenca">
                    <c:forEach items="${licencas}" var="licenca">
                        <option value="${licenca}">${licenca.nomeLicenca}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

		<tr>
			<td><fmt:message key="software.repositorio" /></td>
			<td><input type="text" name="software.repositorio" /></td>
		</tr>
		
		<tr>
            <td><fmt:message key="software.liveDemo" /></td>
            <td><input type="text" name="software.liveDemo" /></td>
        </tr>

		<tr>
			<td><fmt:message key="software.projetos" /></td>
	        <td>
                <input id="projectinput" type="text">
                <select id="selectproject" name="idsProjetos[]" size="4" multiple style="display:none;"></select>
            </td>
		</tr>
		
		<tr>
            <td><fmt:message key="software.linhas" /></td>
            <td>
                <input id="linesinput" type="text">
                <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>
        
        <tr>
            <td><fmt:message key="software.desenvolvedores" /></td>
            <td>
                <input id="authorinput" type="text">
                <select id="selectauthor" name="idsContribuintes[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>
        
        <tr>
            <td><fmt:message key="software.publicacoes" /></td>
            <td>
                <input id="pubinput" type="text">
                <select id="selectpub" name="idsPublicacoes[]" size="4" multiple style="display:none;"></select>
            </td>
        </tr>


		<tr>
			<td colspan="2" align="right"><input type="submit" value="<fmt:message key="inserir" />" />
			</td>
		</tr>
	</table>
</form>

<%@ include file="/errors.jsp" %> 

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
