<%@ include file="/header.jsp" %>

<!----------- TITLE ---------->
    <div id="page-headline">
        
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.publicacoes" /></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">
        
        <div id="container">

		    <div id="article">
		        <div id="aside" class="one-sixth">
                    <jsp:include page="/WEB-INF/jsp/publicacao/filtros.jsp" />
		        </div>
		        <div style="display: inline-block; width: 450px">

					<h2>Full List</h2>
					<ol class="custom-list">
					    <c:forEach items="${publicacoes}" var="publicacao">
					        <li>
					            <strong>"<a href="<c:url value="/publicacao/ver/${publicacao.idPublicacao}"></c:url>">${publicacao.titulo}</a>"</strong>
					        </li>
					    </c:forEach>
					</ol>

                </div> <!-- end inline-block -->
               </div> <!-- end Article -->
               <div class="breakLine"></div>
               <div class="sectionLine"></div>
           </div> <!-- Container -->

       </div><!-- end content --> 



<%@ include file="/footer.jsp" %> 
