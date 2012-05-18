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

<h2>Full List</h2>
<ol class="custom-list">
    <c:forEach items="${publicacoes}" var="publicacao">
        <li>
            <strong>"<a href="<c:url value="/publicacao/ver/${publicacao.idPublicacao}"></c:url>">${publicacao.titulo}</a>"</strong>
        </li>
    </c:forEach>
</ol>

<%--
<h2>Journal papers</h2>
<ol class="custom-list">
<li>STEINMACHER, I. ; CHAVES, A.P. ; GEROSA, M.A. . Awareness Support in Distributed Software Development: A Systematic Review and Mapping of the Literature. Computer Supported Cooperative Work, v. tbd, p. 1-40, 2012.
<li>GEROSA, M.A. ; FUKS, Hugo ; LUCENA, C.J.P. . Tecnologias de Informação Aplicadas à Educação: Construindo uma Rede de Aprendizagem Usando o Ambiente AulaNet. Informática na Educação, v. 4, n. 2, p. 63-74, 2001.
</ol>

        <div class="separator"></div>   
<h2>Books edited</h2>
<ol class="custom-list">
<li>GEROSA, M. A. (Org.) ; HIRATA, C. (Org.) . Anais do VII Simpósio Brasileiro de Sistemas Colaborativos. IEEE, 2010. 200 p.
<li>SALGADO, A.C. (Org.) ; GEROSA, M.A. (Org.) . Anais do IV Simpósio Brasileiro de Sistemas Colaborativos. Porto Alegre: SBC, 2007.
</ol>

        <div class="separator"></div>   
<h2>Book chapters</h2>
<ol class="custom-list">
<li>FUKS, Hugo ; RAPOSO, Alberto Barbosa ; GEROSA, M.A. . Engenharia de Groupware: Desenvolvimento de Aplicações Colaborativas. In: Ingrid Jansch Porto. (Org.). XXI Jornada de Atualização em Informática. Porto Alegre: SBC, 2002, v. 2, p. 89-129.
</ol>

        <div class="separator"></div>   
<h2>Conference full papers</h2>
<ol class="custom-list">
<li>STEINMACHER, I. ; WIESE, I. S. ; GEROSA, M. A. . Recommending Mentors to Software Project Newcomers. In: 3rd International Workshop on Recommendation Systems for Software Engineering (RSSE), 2012, Zurich, Switzerland. Proceedings of the 3rd International Workshop on Recommendation Systems for Software Engineering (RSSE). Washington : IEEE Computer Sciences, 2012.
</ol>


<div class="separator"></div>   
<h2>Conference short papers</h2>
<ol class="custom-list">
<li>MARTINS, S.M. ; GEROSA, M. A. . Um modelo para o suporte computacional da inteligência coletiva na web. In: VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC), 2011, Parati - RJ. Anais do VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC), 2011. p. 33-36.
<li>FOUTOURA, V. ; STEINMACHER, I. ; WIESE, I. S. ; GEROSA, M. A. . Predição de falhas em projetos de software baseado em métricas de redes sociais de comunicação e cooperação. In: VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC), 2011, Parati - RJ. Anais do VIII Simpósio Brasileiro de Sistemas Colaborativos (SBSC), 2011. p. 37-40.
</ol>
--%>
        </div><!-- end content -->
 



<%@ include file="/footer.jsp" %> 
