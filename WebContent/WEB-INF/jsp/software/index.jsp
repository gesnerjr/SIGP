<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.software"/></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->

    <div id="wrapper">

        <div id="content" class="cont-left">
    
	<c:forEach items="${softwarelist}" var="s">
		<h3><a href="<c:url value='/software/view/${s.idSoftware}'></c:url>">${s.nome}</a></h3>
	</c:forEach>

    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
