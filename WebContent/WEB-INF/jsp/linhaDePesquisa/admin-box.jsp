<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>
            <li><a href="<c:url value='/lines/add'></c:url>"><fmt:message key="novo" /></a></li>
            <c:if test="${not empty linhapesquisa.idPesquisa}">
            <li><a href="<c:url value='/lines/edit/${linhapesquisa.idPesquisa}'></c:url>"><fmt:message key="alterar" /></a></li>
            <li><a href="<c:url value='/lines/del/${linhapesquisa.idPesquisa}'></c:url>"><fmt:message key="apagar" /></a></li>
            </c:if>
