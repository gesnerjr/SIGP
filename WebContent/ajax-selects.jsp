<script type="text/javascript">

    function adicionarOptionJSP(select, id, name){
        $(select).append('<option value="'+id+'" selected>'+name+'</option');
    }

    function adicionarOption(select, item){
        if ( $(select+" option[value='"+item.id+"']").length == 0 ){
            $(select).append('<option value="'+item.id+'">'+item.name+'</option');
        }
        $(select+" option[value='"+item.id+"']").attr('selected','selected');
    }
    
    function removerOption(select, item){
    	$(select+" option[value='"+item.id+"']").removeAttr('selected');
    }

    $(document).ready(function() {
<%--------------------------------------------------------------------------------------------------
 Ajax Selector para PROJETOS
--------------------------------------------------------------------------------------------------%>    	
		<c:if test="${!empty todosprojetos}">
	        $("#projectinput").tokenInput(
	                [
	                <c:forEach items="${todosprojetos}" var="p" varStatus="loop">
	                {"id":"${p.idProjeto}","name":"${p.nome}"}${!loop.last ? ',' : ''}
	                </c:forEach>
	                ]
	            , {
	            preventDuplicates: true,
	            onAdd: function (item) {
	            	adicionarOption("#selectproject", item);
	            },
	            onDelete: function (item) {
	            	removerOption("#selectproject", item);
	            },
	            prePopulate: [
	               <c:forEach items="${lprojetos}" var="p" varStatus="loop">
	               {"id":"${p.idProjeto}","name":"${p.nome}"}${!loop.last ? ',' : ''}
	               </c:forEach>
	            ]
	        });
	        
	        <c:if test="${!empty lprojetos}">
	            <c:forEach items="${lprojetos}" var="p" varStatus="loop">
	                adicionarOptionJSP("#selectproject", "${p.idProjeto}", "${p.nome}");
	            </c:forEach>    
	        </c:if>
	        
	   </c:if>
   
<%--------------------------------------------------------------------------------------------------
 Ajax Selector para PUBLICACOES
--------------------------------------------------------------------------------------------------%>        
      <c:if test="${!empty todaspublicacoes}">
          $("#pubinput").tokenInput(
                  [
                  <c:forEach items="${todaspublicacoes}" var="p" varStatus="loop">
                  {"id":"${p.idPublicacao}","name":"${p.titulo}"}${!loop.last ? ',' : ''}
                  </c:forEach>
                  ]
              , {
              preventDuplicates: true,
              onAdd: function (item) {
                  adicionarOption("#selectpub", item);
              },
              onDelete: function (item) {
                  removerOption("#selectpub", item);
              },
              prePopulate: [
                 <c:forEach items="${lpublicacoes}" var="p" varStatus="loop">
                 {"id":"${p.idPublicacao}","name":"${p.titulo}"}${!loop.last ? ',' : ''}
                 </c:forEach>
              ]
          });
          
          <c:if test="${!empty lpublicacoes}">
              <c:forEach items="${lpublicacoes}" var="p" varStatus="loop">
                  adicionarOptionJSP("#selectpub", "${p.idPublicacao}", "${p.titulo}");
              </c:forEach>    
          </c:if>
          
     </c:if>   
   
<%--------------------------------------------------------------------------------------------------
 Ajax Selector para LINHAS DE PESQUISA
--------------------------------------------------------------------------------------------------%>
   <c:if test="${!empty todaslinhas}">
	   $("#linesinput").tokenInput(
	           [
	           <c:forEach items="${todaslinhas}" var="l" varStatus="loop">
	           {"id":"${l.idPesquisa}","name":"${l.nome}"}${!loop.last ? ',' : ''}
	           </c:forEach>
	           ]
	       , {
	       preventDuplicates: true,
	       onAdd: function (item) {
	           adicionarOption("#selectlines", item);
	       },
	       onDelete: function (item) {
	           removerOption("#selectlines", item);
	       },
	       prePopulate: [
	          <c:forEach items="${llinhas}" var="l" varStatus="loop">
	          {"id":"${l.idPesquisa}","name":"${l.nome}"}${!loop.last ? ',' : ''}
	          </c:forEach>
	       ]
	   });
	   
	   <c:if test="${!empty llinhas}">
	       <c:forEach items="${llinhas}" var="l" varStatus="loop">
	           adicionarOptionJSP("#selectlines", "${l.idPesquisa}", "${l.nome}");
	       </c:forEach>    
	   </c:if>
	   
	</c:if>

<%--------------------------------------------------------------------------------------------------
Ajax Selector para MEMBROS
--------------------------------------------------------------------------------------------------%>
   <c:if test="${!empty todoscontribuintes}">
        $("#authorinput").tokenInput(
                [
                <c:forEach items="${todoscontribuintes}" var="contrib" varStatus="loop">
                {"id":"${contrib.idContribuinte}","name":"${contrib.nome} (${contrib.nomeCitacao})"}${!loop.last ? ',' : ''}
                </c:forEach>
                ]
            , {
            preventDuplicates: true,
            onAdd: function (item) {
            	adicionarOption("#selectauthor", item);
            },
            onDelete: function (item) {
                removerOption("#selectauthor", item);
            },
            prePopulate: [
	           <c:forEach items="${lcontribuintes}" var="c" varStatus="loop">
	           {"id":"${c.idContribuinte}","name":"${c.nome} (${c.nomeCitacao})"}${!loop.last ? ',' : ''}
	           </c:forEach>
            ]
        });
        
        <c:if test="${!empty lcontribuintes}">
            <c:forEach items="${lcontribuintes}" var="c" varStatus="loop">
                adicionarOptionJSP("#selectauthor", "${c.idContribuinte}", "${c.nome}");
            </c:forEach>    
        </c:if>
        
        <c:if test="${headername == 'projeto'}">
	        $("#coordinput").tokenInput(
	                [
	                <c:forEach items="${todoscontribuintes}" var="c" varStatus="l">
	                {"id":"${c.idContribuinte}","name":"${c.nome} (${c.nomeCitacao})"}${!l.last ? ',' : ''}
	                </c:forEach>
	                ]
	            , {
	            preventDuplicates: true,
	            onAdd: function (item) {
	                adicionarOption("#selectcoord", item);
	            },
	            onDelete: function (item) {
	                removerOption("#selectcoord", item);
	            },
	            prePopulate: [
	               <c:forEach items="${lcoordenadores}" var="c" varStatus="l">
	               {"id":"${c.idContribuinte}","name":"${c.nome} (${c.nomeCitacao})"}${!l.last ? ',' : ''}
	               </c:forEach>
	            ]
	        });
	        
	        <c:if test="${!empty lcoordenadores}">
	            <c:forEach items="${lcoordenadores}" var="c" varStatus="l">
	                adicionarOptionJSP("#selectcoord", "${c.idContribuinte}", "${c.nome}");
	            </c:forEach>    
	        </c:if>
	        
	        $("#memberinput").tokenInput(
                    [
                    <c:forEach items="${todoscontribuintes}" var="c" varStatus="l">
                    {"id":"${c.idContribuinte}","name":"${c.nome} (${c.nomeCitacao})"}${!l.last ? ',' : ''}
                    </c:forEach>
                    ]
                , {
                preventDuplicates: true,
                onAdd: function (item) {
                    adicionarOption("#selectmember", item);
                },
                onDelete: function (item) {
                    removerOption("#selectmember", item);
                },
                prePopulate: [
                   <c:forEach items="${lmembros}" var="c" varStatus="l">
                   {"id":"${c.idContribuinte}","name":"${c.nome} (${c.nomeCitacao})"}${!l.last ? ',' : ''}
                   </c:forEach>
                ]
            });
            
            <c:if test="${!empty lmembros}">
                <c:forEach items="${lmembros}" var="c" varStatus="l">
                    adicionarOptionJSP("#selectmember", "${c.idContribuinte}", "${c.nome}");
                </c:forEach>    
            </c:if>
        
        </c:if>
        
    </c:if>
    
    });
    
</script>     
