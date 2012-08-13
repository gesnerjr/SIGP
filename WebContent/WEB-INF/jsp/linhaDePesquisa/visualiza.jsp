<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
    
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2><fmt:message key="header.linhaspesquisa"/></h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">
    
        <h2>${linhapesquisa.nome}</h2>
<p>
	<b>Descrição:</b><br />
	${linhapesquisa.descricao}
</p>
<p>
	<b>Linhas de Origem:</b>
	<c:choose>
		<c:when test="${linhapesquisa.linhasPai != null}">
			<c:forEach items="${linhapesquisa.linhasPai}" var="lpai">${lpai.nome}, </c:forEach>
		</c:when>
		<c:otherwise> nenhuma </c:otherwise>
	</c:choose>
</p>
<p>
	<b>Linhas Filhas:</b>
	<c:choose>
		<c:when test="${linhapesquisa.linhasFilhas != null}">
			<c:forEach items="${linhapesquisa.linhasFilhas}" var="lpai">${lpai.nome}, </c:forEach>
		</c:when>
		<c:otherwise> nenhuma </c:otherwise>
	</c:choose>
</p>
<p><b>Projetos:</b></p>
<ul>
	<c:forEach items="${linhapesquisa.projetos}" var="projeto">
		<li><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a>
		</li>
	</c:forEach>
</ul>

<p>Publicações:</p>
<c:forEach items="${pubmap}" var="ano">
<h3>${ano.key}</h3>
<ul class="arrows">
    <c:forEach items="${ano.value}" var="p">
    <li>${p.titulo}</li>
    </c:forEach>
</ul>
<br />
</c:forEach>


<!-- <p>Contribuintes:</p> -->
<%-- <ul><c:forEach items="${linhapesquisa.contribuintes}" var="contribuinte"> --%>
<%-- 	<li><a href="/SIGP/contribuinte/ver/${contribuinte.idContribuinte}">${contribuinte.nome}</a></li> --%>
<%-- </c:forEach></ul> --%>


        </div><!-- end content -->

<%@ include file="/footer.jsp" %> 
