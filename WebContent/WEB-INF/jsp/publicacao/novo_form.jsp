<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
        
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.publicacoes" />: <fmt:message key="inserir" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">       
    
<form method="post" action='<c:url value="/publicacao/cria"/>' enctype="multipart/form-data">

		<p>
			<label><fmt:message key="publicacao.titulo" /></label><br />
			<input class="textbox sigp" type="text" name="publicacao.titulo" />
		</p>

		<p>
			<label><fmt:message key="publicacao.autores" /></label><br />
			     <input id="authorinput" type="text">
				<select id="selectauthor" name="idsContribuintes[]" size="4" multiple style="width:440px;display:none;"></select>
		</p>
				
		<p>
		  <label><fmt:message key="publicacao.status" /> (*)</label><br />
		  <select class="textbox sigp" name="publicacao.status">
                 <c:forEach items="${statuses }" var="status">
                        <option value="${status}">${status.publicacaoStatus}</option>
                 </c:forEach>
            </select>
		</p>
		
		<div class="spacer"></div>
        <h2>Publishing Information</h2>

		<p>
			<label><fmt:message key="publicacao.veiculotipo" /></label><br />
			<select class="textbox sigp" name="publicacao.veiculoTipo">
					<c:forEach items="${veiculos}" var="veiculo">
						<option value="${veiculo}">${veiculo.tipoVeiculo}</option>
					</c:forEach>
			</select>
		</p>
		<p>
			<label><fmt:message key="publicacao.data" /></label><br />
				<input type="text" id="month" name="month" class="monthPicker textbox sigp" />
				<input type="hidden" class="yearResult"  name="publicacao.ano" value="" />
				<input type="hidden" class="monthResult" name="publicacao.mes" value="" />
		</p>
		
		<p>
			<label><fmt:message key="publicacao.veiculonome" /></label><br />
			<input class="textbox sigp" type="text" name="publicacao.veiculoNome" />
		</p>
		
		<p>
            <label><fmt:message key="publicacao.nome_editora" /></label><br />
            <input class="textbox sigp" type="text" name="publicacao.publisherName" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.cidade" /></label><br />
            <input class="textbox sigp" type="text" name="publicacao.publisherCity" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.pais" /></label><br />
            <% // <input class="textbox sigp" type="text" name="publicacao.publisherCity" /> %>
            TODO: colocar a classe Country e popular o BD. <br />
        </p>
		
		
        <p>
            <label><fmt:message key="publicacao.volume" />:</label>&nbsp;
            <input class="textbox" type="text" name="publicacao.volume" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.series" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.series" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.startPage" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.startPage" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.endPage" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.endPage" style="width:60px;" />
        </p>
        
        <p>
            <label><fmt:message key="publicacao.fascicle" />:</label>&nbsp;
            <input class="textbox" type="text" name="publicacao.fascicle" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.isbn" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.isbn" style="width:60px;" />
            &nbsp;&nbsp;
            <label><fmt:message key="publicacao.issn" />: </label>&nbsp;
            <input class="textbox" type="text" name="publicacao.issn" style="width:60px;" />
        </p>
        
		<p>
			<label><fmt:message key="publicacao.link" /></label><br />
			<input class="textbox sigp" type="text" name="publicacao.linkEditora" />
		</p>
		
		<div class="spacer"></div>
		<h2>Work Metadata</h2>
		<p>
			<label><fmt:message key="publicacao.resumo" /></label><br />
			<textarea class="textbox sigp" name="publicacao.resumo" rows="5" cols="60"></textarea>
		</p>

		<p>
			<label><fmt:message key="publicacao.abstract" /></label><br />
			<textarea class="textbox sigp" name="publicacao.paperAbstract" rows="5" cols="60"></textarea>
		</p>
		
		<p>
			<label><fmt:message key="publicacao.bibtex" /></label><br />
			<textarea class="textbox sigp" name="publicacao.bibtex" rows="5" cols="60"></textarea>
		</p>
		
        <div class="spacer"></div>		
       	<h2><fmt:message key="publicacao.selecionar_projetos" /></h2>	
		<p>
           <input id="projectinput" type="text">
           <select id="selectproject" name="idsProjetos[]" size="4" multiple style="width:440px;display:none;"></select>
        </p>
        
        <div class="spacer"></div>      
        <h2><fmt:message key="publicacao.linhas" /></h2>   
        <p>
           <input id="linesinput" type="text">
           <select id="selectlines" name="idsLinhas[]" size="4" multiple style="display:none;"></select>
        </p>

		
		<div class="spacer"></div>
		<h2>Files</h2>
		<p>
			<label><fmt:message key="publicacao.pdf" /></label><br />
			<input type="file" name="pdf" />
		</p>
				
		<div class="spacer"></div>
		<p>
			<input class="sigp-button" type="submit" value="Criar" />
		</p>
		<div class="spacer"></div>
</form>

<%@ include file="/errors.jsp" %>
        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 