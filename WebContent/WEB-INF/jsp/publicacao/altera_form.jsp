<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
        
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.publicacoes" />: <fmt:message key="alterar" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">
    
<form method="post" action='<c:url value="/publicacao/altera"/>' enctype="multipart/form-data">
		
		<p>
			<label><fmt:message key="publicacao.titulo" /></label><br />
			<input class="textbox sigp" type="text" name="publicacao.titulo" value="${publicacao.titulo}" />
		</p>
		
		<p>
            <label><fmt:message key="publicacao.autores" /></label><br />
            <input id="authorinput" type="text" />
            <select id="selectauthor" name="idsContribuintes[]" size="4" multiple style="display:none;"></select>
		</p>
		
        <p>
          <label><fmt:message key="publicacao.status" /> (*)</label><br />
          <select class="textbox sigp" name="publicacao.status">
                 <c:forEach items="${statuses }" var="status">
                        <option value="${status}"
                        <c:if test="${publicacao.status == status}">selected="selected"</c:if>>
                        ${status.publicacaoStatus}</option>
                 </c:forEach>
            </select>
        </p>
		
        <div class="spacer"></div>
        <h2>Publishing Information</h2>
		
		<p>
			<label><fmt:message key="publicacao.veiculotipo" /></label><br />
			     <select class="textbox sigp" name="publicacao.veiculoTipo" >
					<c:forEach items="${veiculos}" var="veiculo">
						<option value="${veiculo}"
							<c:if test="${publicacao.veiculoTipo == veiculo}">selected="selected"</c:if>>
							${veiculo.tipoVeiculo}</option>
					</c:forEach>
			     </select>
		</p>
		
		<p>
			<label><fmt:message key="publicacao.data" /></label><br />
				<input class="textbox sigp monthPicker" type="text" id="month" name="month" value="${publicacao.mes + 1}/${publicacao.ano}"/>
				<input type="hidden" class="yearResult"  name="publicacao.ano" value="${publicacao.ano}" />
				<input type="hidden" class="monthResult" name="publicacao.mes" value="${publicacao.mes}" />
		</p>
		
		<p>
			<label><fmt:message key="publicacao.veiculonome" /></label><br />
			<input class="textbox sigp" type="text" name="publicacao.veiculonome" value="${publicacao.veiculoNome}"/>
		</p>
		      
        <p>
            <label><fmt:message key="publicacao.nome_editora" /></label><br />
            <input class="textbox sigp" type="text" name="publicacao.publisherName" value="${publicacao.publisherName }" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.cidade" /></label><br />
            <input class="textbox sigp" type="text" name="publicacao.publisherCity" value="${publicacao.publisherCity }" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.pais" /></label><br />
            <% // <input class="textbox sigp" type="text" name="publicacao.publisherCity" /> %>
            TODO: colocar a classe Country e popular o BD. <br />
        </p>
        
        
        <p>
            <label><fmt:message key="publicacao.volume" />:</label>&nbsp;
            <input class="textbox" type="text" name="publicacao.volume" value="${publicacao.volume }" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.series" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.series" value="${publicacao.series }" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.startPage" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.startPage" value="${publicacao.startPage }" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.endPage" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.endPage" value="${publicacao.endPage }" style="width:60px;" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.fascicle" />:</label>&nbsp;
            <input class="textbox" type="text" name="publicacao.fascicle" value="${publicacao.fascicle }" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.isbn" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.isbn" value="${publicacao.isbn }" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.issn" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.issn" value="${publicacao.issn }" style="width:60px;" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.link" /></label><br />
            <input class="textbox sigp" type="text" name="publicacao.linkEditora" value="${publicacao.linkEditora }" />
        </p>
        
        <div class="spacer"></div>
        <h2>Work Metadata</h2>
		<p>
			<label><fmt:message key="publicacao.resumo" /></label><br />
			<textarea class="textbox sigp" name="publicacao.resumo" rows="5" cols="60">${publicacao.resumo}</textarea>
		</p>
		<p>
			<label><fmt:message key="publicacao.abstract" /></label><br />
			<textarea class="textbox sigp" name="publicacao.paperAbstract" rows="5" cols="60">${publicacao.paperAbstract}</textarea>
		</p>
		<p>
			<label><fmt:message key="publicacao.bibtex" /></label><br />
			<textarea class="textbox sigp" name="publicacao.bibtex" rows="5" cols="60">${publicacao.bibtex}</textarea>
		</p>
		
		
		<div class="spacer"></div>        
        <h2><fmt:message key="publicacao.selecionar_projetos" /></h2>
		<p>
            <label><fmt:message key="publicacao.selecionar_projetos" /></label><br />
                 <input id="projectinput" type="text"/>
                <select id="selectproject" name="idsProjetos[]" size="4" multiple style="display:none;"></select>
		</p>
		
		
		<div class="spacer"></div>      
        <h2><fmt:message key="publicacao.linhas" /></h2>
        <p>
            <label><fmt:message key="publicacao.linhas" /></label><br />
                 <input id="linesinput" type="text"/>
                <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
        </p>
		
		<div class="spacer"></div>
        <h2>Files</h2>
		<p>
			<label><fmt:message key="publicacao.pdf" /></label><br />
			<input type="file" name="pdf"/>
		</p>
				
		<p>
			<input type="hidden" name="publicacao.idPublicacao" value="${publicacao.idPublicacao}" />
			<input class="sigp-button" type="submit" value="Alterar" />
		</p>
</form>

<%@ include file="/errors.jsp" %>

    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
