<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${publicacao.titulo}</h2>

<p>
	<b><fmt:message key="publicacao.resumo" /></b> <br /> ${publicacao.resumo}
</p>
<p>
	<b><fmt:message key="publicacao.abstract" /></b> <br /> ${publicacao.paperAbstract}
</p>
<p>
	<b><fmt:message key="publicacao.autores" /></b>
</p>
<ul>
	<c:forEach items="${publicacao.contribuintes}" var="contribuinte">
 		<li><a href="/SIGP/contribuinte/ver/${contribuinte.idContribuinte}">${contribuinte.nome}</a></li>
 	</c:forEach>
</ul>
<p>
	<b><fmt:message key="publicacao.data" /></b> <br /> <fmt:message key="mes.${publicacao.mes}" />, ${publicacao.ano}
</p>
<p>
	<b><fmt:message key="publicacao.veiculo" /></b> <br /> ${publicacao.veiculoTipo.tipoVeiculo},<br /> ${publicacao.veiculoNome}
</p>


<p><b><fmt:message key="publicacao.projetos" /></b></p>
<ul>
	<c:forEach items="${publicacao.projetos}" var="projeto">
		<li><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a>
		</li>
	</c:forEach>
</ul>

<p>
	<b><fmt:message key="publicacao.link" /></b> <br /> ${publicacao.linkEditora}
</p>

<p>
	<b><fmt:message key="publicacao.bibtex" /></b> <br /> ${publicacao.bibtex}
</p>
<p>
	<b><fmt:message key="publicacao.pdf" /></b> <br /> <a href='<c:url value="/publicacao/pdf/${publicacao.idPublicacao}"/>'>${publicacao.titulo}</a>
</p>

<p>
	<a href="/SIGP/publicacao/alterar/${publicacao.idPublicacao}"><fmt:message key="alterar" /></a>
	<a href="/SIGP/publicacao/apagar/${publicacao.idPublicacao}"><fmt:message key="apagar" /></a>
</p>

<hr />
<p>
	<a href="/SIGP/publicacao/"><fmt:message key="publicacao.voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
