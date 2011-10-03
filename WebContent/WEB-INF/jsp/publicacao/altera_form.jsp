<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SIGP</title>
</head>
<body>
	<form method="post" action="/SIGP/publicacao/altera">
		<table>
			<tr>
				<td>Título:</td>
				<td><input type="text" name="publicacao.titulo"
					value="${publicacao.titulo}" /></td>
			</tr>
			<tr>
				<td>Veículo:</td>
				<td><select name="publicacao.veiculo">
						<c:forEach items="${veiculos}" var="veiculo">
							<option value="${veiculo}"
								<c:if test="${publicacao.veiculo == veiculo}">selected="selected"</c:if>>
								${veiculo}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Data:</td>
				<td><input type="text" name="publicacao.data"
					value="${publicacao.data}" /> (Modifique para formato DD/MM/YYYY)</td>
			</tr>
			<tr>
				<td colspan="2"><input type="hidden"
					name="publicacao.idPublicacao" value="${publicacao.idPublicacao}" />
					<input type="submit" value="Alterar" /></td>
			</tr>
		</table>
	</form>
	<p>
		<a href="/SIGP/publicacao/">Voltar</a>
	</p>
</body>
</html>