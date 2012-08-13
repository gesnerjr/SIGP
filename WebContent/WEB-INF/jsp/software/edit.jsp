<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2>${software.nome}: <fmt:message key="alterar"/></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">

<form method="post" action="<c:url value='/software/update'></c:url>">
        <p>
            <label><fmt:message key="software.nome" /></label><br />
            <input class="sigp textbox" type="text" name="software.nome" value="${software.nome}"/>
        </p>

        <p>
            <label><fmt:message key="software.descricao" /></label><br />
            <textarea class="sigp textbox" name="software.descricao" rows="5" cols="60">${software.descricao}</textarea>
        </p>
        
        <p>
            <label><fmt:message key="software.licenca" /></label><br />
                <select class="sigp textbox" name="software.licenca">
                    <c:forEach items="${licencas}" var="licenca">
                        <option value="${licenca}" 
                        <c:if test="${software.licenca == licenca}">selected="selected"</c:if>>
                        ${licenca.nomeLicenca}</option>
                    </c:forEach>
                </select>
        </p>

        <p>
            <label><fmt:message key="software.repositorio" /></label><br />
            <input class="sigp textbox" type="text" name="software.repositorio" value="${software.repositorio}"/>
        </p>
        
        <p>
            <label><fmt:message key="software.liveDemo" /></label><br />
            <input class="sigp textbox" type="text" name="software.liveDemo" value="${software.liveDemo}" />
        </p>

        <p>
            <label><fmt:message key="software.projetos" /></label><br />
                <input id="projectinput" type="text">
                <select id="selectproject" name="idsProjetos[]" size="4" multiple style="display:none;"></select>
        </p>
        
        <p>
            <label><fmt:message key="software.linhas" /></label><br />
                <input id="linesinput" type="text">
                <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
        </p>
        
        <p>
            <label><fmt:message key="software.desenvolvedores" /></label><br />
                <input id="authorinput" type="text">
                <select id="selectauthor" name="idsContribuintes[]" size="4" multiple style="display:none;"></select>
        </p>
        
        <p>
            <label><fmt:message key="software.publicacoes" /></label><br />
                <input id="pubinput" type="text">
                <select id="selectpub" name="idsPublicacoes[]" size="4" multiple style="display:none;"></select>
        </p>

		<p>
			<input class="sigp-button" type="hidden" name="software.idSoftware"
				value="${software.idSoftware}" /> <input type="submit" value="Alterar" />
		</p>
</form>

        <%@ include file="/errors.jsp" %> 
        
        
        </div><!-- end content -->
<%@ include file="/footer.jsp" %> 