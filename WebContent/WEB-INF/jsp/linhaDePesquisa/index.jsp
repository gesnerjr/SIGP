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
        
            <c:forEach items="${linhasdepesquisa}" var="linha" varStatus="loop">
		        <h3><a href="<c:url value='/lines/view/${linha.idPesquisa}'></c:url>">${linha.nome}</a></h3>
		        <%-- <img src="images/metricminer.png" width=60% height=60% alt="Metric Miner." /> --%>
		        <p>${linha.descricao}</p>
		        <p>Projects: <c:forEach items="${linha.projetos}" var="p" varStatus="pl"><a href="<c:url value='/projeto/ver/${p.idProjeto}'></c:url>"></a>${!pl.last ? ',' : ''}</c:forEach></p>
		    
		        <c:if test="${!empty linha.publicacoes}">
                <p>Recent publications:</p>
                    <ul class="custom-list arrows">
			        <c:forEach items="${linha.publicacoes}" var="p" end="4">
			        <li>
			             <c:forEach items="${p.contribuintes}" var="c" varStatus="cl">${c.nomeCitacao}${!cl.last ? ',' : ''}</c:forEach> (${p.ano})
			             "${p.titulo}". ${p.veiculoNome}, ${p.mes}
			        </li>
			        <%-- 
	                    <li>Fontoura, V.D., Steinmacher, I., Wiese, I.S., Gerosa, M. A. (2011) 
	                    “Predição de falhas em projetos de software baseado em métricas de redes sociais de comunicação e cooperação”. 
	                    Anais do VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC 2011),
	                     5-7 de Outubro, 
	                     Parati-RJ, 
	                     ISBN 9788576692546, 
	                     p. 37-40.
	                     </li>			        
			        --%>
			        </c:forEach>
			        </ul>
                <a class="button" href="<c:url value='/publicacao/'></c:url>">View publications</a>
		        </c:if>
		    
		        ${!loop.last ? '<div class="separator"></div>' : ''}     
		    </c:forEach>
		    
		    <div class="separator"></div>
            
            <a name="groupware"></a>
            <h3>Collaborative Environments on the Web</h3>
            <img src="images/Componentes3C.jpg" width=60% height=60% alt="Component based approach for collaborative systems development." />
            <p>We develop an infrastructure and a methodology to conceive and build collaborative environments on the Web 2.0. Our approach is based on Software Components technology and on the 3C collaboration model. Some of the resulting projects are award winning.</p>
            <p>Projects: <a href="http://www.groupwareworkbench.org.br" target=_blank>Groupware Workbench</a>, <a href="http://www.arquigrafia.org.br" target=_blank>Arquigrafia-Brasil</a>, <a href="#">Smart Audio City Guide</a></p>
            <p>Main research topics:</p>
            <hr>
            <h5>Software components for Web-based collaborative environments development</h5>   
                <p>Selected publications:</p>
                <ul class="custom-list arrows">
                    <li>Fuks, H., Raposo, A.B., Gerosa, M.A., Lucena, C.J.P. (2005), “Applying the 3C Model to Groupware Development”, International Journal of Cooperative Information Systems (IJCIS), v.14, n.2-3, Jun-Sep 2005, World Scientific, ISSN 0218-8430, p. 299-328. 
                </ul>
                <hr>
            <h5>Software Product Line approach for collaborative environments development</h5>  
                <p>Selected publications:</p>
                <ul class="custom-list arrows">
                    <li>Oliveira, L.S., Gerosa, M. A. (2011) “Collaborative Features in Content Sharing Web 2.0 Social Networks: A Domain Engineering Based on the 3C Collaboration Model”. 17th CRIWG Conference on Collaboration and Technology (CRIWG 2011), Springer, Lecture Notes in Computer Science, v.6969, October 2-7, Paraty-RJ, p. 142-157.
                </ul>
                <hr>
            <h5>Collective Inteligence in the Web</h5>  
                <p>Selected publication:</p>
                <ul class="custom-list arrows">
                    <li>Michalsky, S., Gerosa, M. A. (2011) “Um modelo para o suporte computacional da inteligência coletiva na web”. Anais do VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC 2011), 5-7 de Outubro, Parati-RJ, ISBN 9788576692546, p. 33-36.
                </ul>
                <hr>
            <h5>Collaborative environments</h5> 
                <p>Selected publication:</p>
                <ul class="custom-list arrows">
                    <li>Rozestraten, A.S., Martinez, M. L., Gerosa, M.A., Kon, F., Santos, A.P.O.  (2010) “Rede Social Arquigrafia-Brasil: Estudos Iconográficos da Arquitetura Brasileira na Web 2.0”. Anais do Seminário Nacional Documentação do Patrimônio Arquitetônico com o uso de Tecnologias Digitais, Salvador, 9-10 de Dezembro de 2010.
                </ul>
                <hr>
            <a class="button" href="publications.html">View all publications</a>
            <div class="separator"></div>
               
        </div><!-- end content -->

<%@ include file="/footer.jsp" %> 
