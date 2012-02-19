<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Header 2</h2>



<p>
	<b>Disciplina:</b> ${disciplina.nome} (${disciplina.sigla})
</p>
<p>
	<b>Ementa:</b> <br /> ${disciplina.ementa}
</p>
<p>
	<b>Grupo ministrante: </b> <a href="/SIGP/grupo/ver/${disciplina.grupo.idGrupo}">${disciplina.grupo.nome}</a>
</p>
<p>
	<a href="/SIGP/disciplina/alterar/${disciplina.idDisciplina}">Alterar</a>
	- <a href="/SIGP/disciplina/apagar/${disciplina.idDisciplina}">Apagar</a>
</p>

<hr />
<p>
	<a href="/SIGP/disciplina/"><fmt:message key="disciplina.voltar" /></a>
</p>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
