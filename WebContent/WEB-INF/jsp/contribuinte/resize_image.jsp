<%@ include file="/header.jsp" %> 

<script language="Javascript">
$(function(){

	$('#jcrop_target').Jcrop({
		onChange: updateCoords,
		onSelect: updateCoords,
		aspectRatio: 1,
		boxWidth: 800, 
		boxHeight: 800
	});

	function updateCoords(c)
	{
		$('#x').val(c.x);
		$('#y').val(c.y);
		$('#w').val(c.w);
		$('#h').val(c.h);
	};
	
	$('#cancelar').click(function(){
		   window.location.href='<c:url value="/contribuinte/ver/${contribuinte.idContribuinte}"></c:url>';
	})

});

</script>

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Contribuinte: Redimensionar foto</h2>


<form method="post" action="/SIGP/contribuinte/resfoto/${contribuinte.idContribuinte}/2">
<img src="<c:url value="/contribuinte/foto/${contribuinte.idContribuinte}"></c:url>" id="jcrop_target" />
<input type="hidden" name="contribuinte.idContribuinte"	value="${contribuinte.idContribuinte}" />
<input type="hidden" name="x" id="x" />
<input type="hidden" name="y" id="y" />
<input type="hidden" name="w" id="w" />
<input type="hidden" name="h" id="h" />
<br />
<input type="submit" value="Redimensionar foto" />
<input type="button" value="Cancelar" id="cancelar" />

</form>

<%@ include file="/errors.jsp" %> 

<p>
	<a href="/SIGP/contribuinte/"><fmt:message key="voltar" /></a>
</p>

        
    </div> <!-- id=contents -->


<%@ include file="/footer.jsp" %> 
