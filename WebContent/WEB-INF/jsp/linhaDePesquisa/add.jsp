<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.linhaspesquisa"/>: <fmt:message key="inserir" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        


<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">
        
        
        <%@ include file="/errors.jsp" %> 


<form method="post" action="<c:url value='/lines/create'></c:url>">
		<p>
			<label><fmt:message key="linha.nome" /></label> <span class="tiny">(*)</span>:<br />
			<input class="textbox sigp" type="text" name="linhapesquisa.nome" />
		</p>
		<p>
			<label><fmt:message key="linha.descricao" />:</label><br />
			<textarea class="textbox sigp" name="linhapesquisa.descricao" rows="5" cols="60"></textarea>
		</p>
		<p>
			<label><fmt:message key="linha.linhapai" />:</label><br />
			<select name="idsLinhasPai[]" size="4" multiple style="width:440px;" >
					<option value="0" selected><fmt:message key="nenhuma" /></option>
					<c:forEach items="${linhasdepesquisa}" var="linhaslista">
						<c:if test="${linhaslista.idPesquisa != linhapesquisa.idPesquisa}">
							<option value="${linhaslista.idPesquisa}">
								${linhaslista.nome}</option>
						</c:if>
					</c:forEach>
			</select>
		</p>
		<p>
			<input class="sigp-button" type="submit" value="<fmt:message key="inserir" />" />
		</p>
</form>

        </div><!-- end content -->

<%@ include file="/footer.jsp" %> 