<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Projetos</h2>



	<c:forEach items="${projetos}" var="projeto">
		<h3><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a></h3>
		<p>${projeto.descricao}</p>
	</c:forEach>



<p>
	<a href="novo"><fmt:message key="novo" /></a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
