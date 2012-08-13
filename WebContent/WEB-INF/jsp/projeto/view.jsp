<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2>${projeto.nome}</h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">

			<p>
				<b><fmt:message key="projeto.descricao" /></b> <br /> ${projeto.descricao}
			</p>
			
			<p>
				<b><fmt:message key="projeto.site" /></b> <br /> <a href="${projeto.site}">${projeto.site}</a>
			</p>
			
			<p>
				<b><fmt:message key="projeto.financiamento" /></b> <br /> ${projeto.financiamento}
			</p>
			
			<!-- Coordenadores -->
			<c:if test="${!empty projeto.coordenadores}">
			<p>
			    <b><fmt:message key="projeto.coordenadores" /></b>
			    <ul>
			    <c:forEach items="${projeto.coordenadores}" var="c">
			        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
			    </c:forEach>
			    </ul>
			</c:if>
			
			<!-- Membros -->
			<c:if test="${!empty projeto.membros}">
			<p>
			    <b><fmt:message key="projeto.membros" /></b>
			    <ul>
			    <c:forEach items="${projeto.membros}" var="c">
			        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
			    </c:forEach>
			    </ul>
			</c:if>
			
			
			<!-- LinhaPesquisa -->
			<c:if test="${!empty projeto.linhasDePesquisa}">
			<p>
				<b><fmt:message key="projeto.linhas_de_pesquisa" /></b>
				<ul>
				<c:forEach items="${projeto.linhasDePesquisa}" var="linha">
					 <li><a href="<c:url value='/linhadepesquisa/ver/${linha.idPesquisa}'></c:url>">${linha.nome}</a></li>
				</c:forEach>
				</ul>
			</c:if>	
			
			<!-- Publicacoes -->
			<c:if test="${!empty projeto.publicacoes}">
			<p>
				<b><fmt:message key="projeto.publicacoes" /></b>
				<ul>
				<c:forEach items="${projeto.publicacoes}" var="publicacao">
					<li><a href="<c:url value='/publicacao/ver/${publicacao.idPublicacao}'></c:url>">${publicacao.titulo}</a></li>
				</c:forEach>
				</ul>
			</p>
			</c:if>
        
        </div><!-- end content -->
<%@ include file="/footer.jsp" %> 
