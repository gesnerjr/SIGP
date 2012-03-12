<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">${projeto.nome}</h2>


<p>
	<b><fmt:message key="projeto.financiamento" /></b> <br /> ${projeto.financiamento}
</p>

<p>
	<b><fmt:message key="projeto.descricao" /></b> <br /> ${projeto.descricao}
</p>

<!-- LinhaPesquisa -->
<p>
	<b><fmt:message key="projeto.linhas_de_pesquisa" /></b>
	<ul>
	<c:forEach items="${projeto.linhasDePesquisa}" var="linha">
		<li><a href="/SIGP/linhadepesquisa/ver/${linha.idPesquisa}">${linha.nome}</a></li>
	</c:forEach>
	</ul>


<!-- Participacoes -->
<p>
	<b><fmt:message key="projeto.contribuintes" /></b>
	<ul>
	<c:forEach items="${projeto.participacoes}" var="participacao">
		<li><a href="/SIGP/contribuinte/ver/${participacao.contribuinte.idContribuinte}">${participacao.contribuinte.nome}</a></li>
	</c:forEach>
	</ul>
</p>
	<p><a href="/SIGP/projeto/${projeto.idProjeto}/addParticipacao">Adicionar participação</a></p>


<!-- Publicacao -->
<p>
	<b><fmt:message key="projeto.publicacoes" /></b>
	<c:if test="${!empty projeto.publicacoes}">
		<ul>
	</c:if>
	<c:forEach items="${projeto.publicacoes}" var="publicacao">
		<li><a href="/SIGP/publicacoes/ver/${publicacao.idPublicacao}">${publicacao.titulo}</a></li>
	</c:forEach>
	<c:if test="${!empty projeto.publicacoes}">
		</ul>
	</c:if>
</p>


<p>
	<a href="/SIGP/projeto/alterar/${projeto.idProjeto}">Alterar</a>
	- <a href="/SIGP/projeto/apagar/${projeto.idProjeto}">Apagar</a>
</p>

<hr />
<p>
	<a href="/SIGP/projeto/"><fmt:message key="projeto.voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
