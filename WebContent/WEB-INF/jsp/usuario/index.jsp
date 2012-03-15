<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="header.login"/></h2>



<div id=login>
	<c:choose>
	<c:when test="${userIsLogged}">
		<p>
			<fmt:message key="usuario.logadocomo"/> <b>${userName}</b><br />
			<a href="/SIGP/login/sair"> <fmt:message key="usuario.sair"/></a>
		</p>		
	</c:when>
	<c:otherwise>
		<form action="verifica" method="post">
			<table>
				<tr>
					<td><fmt:message key="usuario.nomeusuario" /></td>
					<td><input type="text" name="login"></td>
				</tr>
				<tr>
					<td><fmt:message key="usuario.senha" /></td>
					<td><input type="password" name="senha"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="Login"></td>
				</tr>
			</table>
		</form>
	</c:otherwise>
	</c:choose>
</div>

<c:if test="${userIsAdmin}">
	<p>
		<a href="/SIGP/login/novoUsuario"> <fmt:message key="usuario.registrar" /></a>
	</p>
</c:if>

<%@ include file="/errors.jsp" %>

<div id=erro>
	${logado}
</div>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
