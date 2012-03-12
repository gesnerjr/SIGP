<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Linhas de Pesquisa</h2>


	<c:forEach items="${linhasdepesquisa}" var="linhapesquisa">
		<h3><a href="/SIGP/linhadepesquisa/ver/${linhapesquisa.idPesquisa}">${linhapesquisa.nome}</a></h3>
	</c:forEach>

<br /><br />
<p>
	<a href="/SIGP/linhadepesquisa/novo">Novo</a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
