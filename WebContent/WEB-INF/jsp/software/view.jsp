<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2>${software.nome}</h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">
        
			<p>
				${software.descricao}
			</p>
			        
			<p>
			    <h4 class="view"><fmt:message key="software.licenca" /></h4>
			    ${software.licenca.nomeLicenca}
			</p>        
			
			<p>
			    <h4 class="view"><fmt:message key="software.repositorio" /></h4>
			    <a href="${software.repositorio}">${software.repositorio}</a>
			</p>
			
			<p>
			    <h4 class="view"><fmt:message key="software.liveDemo" /></h4>
			    <a href="${software.liveDemo}">${software.liveDemo}</a>
			</p>
			
			<!-- Projetos -->
			<c:if test="${!empty software.projetos}">
			<p>
			    <h4 class="view"><fmt:message key="software.projetos" /></h4>
			    <ul>
			    <c:forEach items="${software.projetos}" var="p">
			        <li><a href='<c:url value="/projeto/ver/${c.idProjeto}"></c:url>'>${p.nome}</a></li>
			    </c:forEach>
			    </ul>
			</p>    
			</c:if>
			
			<!-- LinhaPesquisa -->
			<c:if test="${!empty software.linhas}">
			<p>
			    <h4 class="view"><fmt:message key="software.linhas" /></h4>
			    <ul>
			    <c:forEach items="${software.linhas}" var="linha">
			        <li><a href="<c:url value='/linhadepesquisa/ver/${linha.idPesquisa}'></c:url>">${linha.nome}</a></li>
			    </c:forEach>
			    </ul>
			</p>
			</c:if> 
			
			<!-- Membros -->
			<c:if test="${!empty software.contribuintes}">
			<p>
			    <h4 class="view"><fmt:message key="software.desenvolvedores" /></h4>
			    <ul>
			    <c:forEach items="${software.contribuintes}" var="c">
			        <li><a href='<c:url value="/contribuinte/ver/${c.idContribuinte}"></c:url>'>${c.nome}</a></li>
			    </c:forEach>
			    </ul>
			</p>
			</c:if>
			
			<!-- Publicacoes -->
			<c:if test="${!empty software.publicacoes}">
			<p>
			    <h4 class="view"><fmt:message key="software.publicacoes" /></h4>
			    <ul>
			    <c:forEach items="${software.publicacoes}" var="publicacao">
			        <li><a href="<c:url value='/publicacao/ver/${publicacao.idPublicacao}'></c:url>">${publicacao.titulo}</a></li>
			    </c:forEach>
			    </ul>
			</p>
			</c:if>

        </div><!-- end content -->
<%@ include file="/footer.jsp" %> 