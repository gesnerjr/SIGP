<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.projetos"/></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">

			<c:forEach items="${projetos}" var="projeto">
			<div class="blog-post">
			    <div class="post-title">
                    <h3><a href="<c:url value='/projeto/ver/${projeto.idProjeto}'></c:url>">${projeto.nome}</a></h3>
                </div>
				<div class="post-content">
    				<p>${projeto.descricaoCurta}</p>
				</div>
                <div class="post-metadata">
                    <c:if test="${!empty projeto.software}">
                    <p>Available software: 
                        <c:forEach items="${projeto.software}" var="software" varStatus="l">
                            <a href="<c:url value="/software/${software.id}" />">${software.name}</a>${not l.last ? ',' : ''}
                        </c:forEach> 
                    </p>
                    </c:if>
                    <c:if test="${projeto.financiamento}"><p>Funding: ${projeto.financiamento}</p></c:if>
                    <c:if test="${projeto.site}"><p>Website: <a href="${projeto.site}">${projeto.site}</a> </p></c:if>
                </div>                                          
                <a class="button" href="#">View publications</a>
			</div>
			<div class="separator"></div>    
			</c:forEach>
	
	
        </div><!-- end content -->
<%@ include file="/footer.jsp" %> 
