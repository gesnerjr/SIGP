<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Grupos</h2>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<c:forEach items="${grupos}" var="grupo">
		<h3><a href="/SIGP/grupo/ver/${grupo.idGrupo}">${grupo.nome}</a></h3>
			<%-- 
			<c:choose>
				<c:when test="${grupo.responsavel != null}">${grupo.responsavel.nome}</c:when>
				<c:otherwise> - </c:otherwise>
			</c:choose>
			--%>
	</c:forEach>



<p>
	<a href="novo"><fmt:message key="novo" /></a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
