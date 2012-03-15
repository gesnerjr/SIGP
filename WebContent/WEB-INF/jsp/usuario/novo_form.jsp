<%@ include file="/header.jsp"%>

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top"><fmt:message key="usuario.novo"/></h2>



<div id=cadastra>
	<form action="salva" method="post">
		<table >
			<tr>
				<td><fmt:message key="usuario.nomeusuario" /></td>
				<td><input type="text" value="" name="usuario.login"></td>
			</tr>
			<tr>
				<td><fmt:message key="usuario.tipousuario" /></td>
				<td><input type="radio" value="USUARIO"	name="usuario.tipoUsuario" checked="checked"> 
					<fmt:message key="usuario.usuario" /> 
					<input type="radio" value="ADMINISTRADOR" name="usuario.tipoUsuario">
					<fmt:message key="usuario.admin" />
				</td>
			</tr>
			<tr>
				<td><fmt:message key="usuario.senha" /></td>
				<td><input type="password" name="usuario.senha"></td>
			</tr>
			<tr>
				<td><fmt:message key="usuario.confirmasenha" /></td>
				<td><input type="password" name="confirma"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="<fmt:message key="usuario.registrar"/>">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/errors.jsp"%>

<div id=erro></div>

        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp"%>
