<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2 class="top">${projeto.nome}: <fmt:message key="alterar" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">
        
<form method="post" action="<c:url value='/projeto/altera'></c:url>">
		<p>
			<label><fmt:message key="projeto.nome" /></label><br />
			<input class="textbox sigp" type="text" name="projeto.nome" value="${projeto.nome}" />
		</p>
		<p>
			<label><fmt:message key="projeto.descricaoCurta" /></label><br />
			<textarea class="textbox sigp" name="projeto.descricaoCurta" rows="5" cols="60">${projeto.descricaoCurta}</textarea>
		</p>
		<p>
			<label><fmt:message key="projeto.descricao" /></label><br />
			<textarea class="textbox sigp" name="projeto.descricao" cols="60" rows="5">${projeto.descricao}</textarea>
		</p>
		<p>
			<label><fmt:message key="projeto.site" /></label><br />
			<input class="textbox sigp" type="text" name="projeto.site" value="${projeto.site}" />
		</p>
		
        <p>
            <label><fmt:message key="projeto.coordenadores" /></label><br />
                <input id="coordinput" type="text">
                <select id="selectcoord" name="idsCoordenadores[]" size="4" multiple style="display:none;"></select>
        </p>
        
        <p>
            <label><fmt:message key="projeto.membros" /></label><br />
                <input id="memberinput" type="text">
                <select id="selectmember" name="idsMembros[]" size="4" multiple style="display:none;"></select>
        </p>
        
        <p>
            <label><fmt:message key="projeto.linhas" /></label><br />
                <input id="linesinput" type="text">
                <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
        </p>				
		<p>
			<label><fmt:message key="projeto.financiamento" /></label><br />
			<input class="textbox sigp" type="text" name="projeto.financiamento"  value="${projeto.financiamento}" />
		</p>
		
		<p>
			<input type="hidden" name="projeto.idProjeto"
				value="${projeto.idProjeto}" /> <input class="sigp-button" type="submit" value="<fmt:message key="alterar" />" />
		</p>
</form>

<%@ include file="/errors.jsp" %> 

        </div><!-- end content -->        
<%@ include file="/footer.jsp" %> 
