<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pagetitle" value="${publicacao.titulo}" />
<%@ include file="/header.jsp" %> 

<!----------- TITLE ---------->
    <div id="page-headline">
        
        <div id="page-headline-inner">  
            <div id="page-title">
                <h2>"${publicacao.titulo}"</h2>
            </div><!-- end page-title -->           
        </div><!-- end page-headline-inner -->
        <div class="separator"></div>   
    </div><!-- end page-headline -->        

<!----------- CORPO ---------->
    <div id="wrapper">

        <div id="content" class="cont-left">       
        
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


<h3><fmt:message key="publicacao.projetos" /></h3>
<p>
<ul>
	<c:forEach items="${publicacao.projetos}" var="projeto">
		<li><a href="/SIGP/projeto/ver/${projeto.idProjeto}">${projeto.nome}</a>
		</li>
	</c:forEach>
</ul>
</p>

<p>
	<b><fmt:message key="publicacao.link" /></b> <br /> ${publicacao.linkEditora}
</p>

<p>
	<b><fmt:message key="publicacao.bibtex" /></b> <br /> ${publicacao.bibtex}
</p>
<p>
	<b><fmt:message key="publicacao.pdf" /></b> <br /> <a href='<c:url value="/publicacao/pdf/${publicacao.idPublicacao}"/>'>${publicacao.titulo}</a>
</p>
        
    </div> <!-- id=contents -->

<%@ include file="/footer.jsp" %> 
