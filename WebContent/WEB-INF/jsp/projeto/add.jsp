<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.projetos" />: <fmt:message key="inserir" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">
    
		<form method="post" action="<c:url value='/projeto/cria'></c:url>">
				<p>
					<label><fmt:message key="projeto.nome" /></label><br />
					<input class="textbox sigp" type="text" name="projeto.nome"/>
				</p>
				
				<p>
					<label><fmt:message key="projeto.site" /></label><br />
					<input class="textbox sigp" type="text" name="projeto.site"/>
				</p>
				
				<p>
					<label><fmt:message key="projeto.descricaoCurta" /></label><br />
					<textarea class="textbox sigp" name="projeto.descricaoCurta" rows="5" cols="60"></textarea>
				</p>
				
				<p>
					<label><fmt:message key="projeto.descricao" /></label><br />
					<textarea class="textbox sigp" name="projeto.descricao" rows="5" cols="60"></textarea>
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
					<input class="textbox sigp" type="text" name="projeto.financiamento"/>
				</p>
		
					
				<p>
					<input class="sigp-button" type="submit" value="<fmt:message key="inserir" />" />
				</p>
		</form>
		
		<%@ include file="/errors.jsp" %> 
        
        
        </div><!-- end content -->
<%@ include file="/footer.jsp" %> 