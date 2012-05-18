<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>
            <li><a href="<c:url value='/publicacao/novo'></c:url>"><fmt:message key="novo" /></a></li>
            <c:if test="${not empty publicacao.idPublicacao}">
            <li><a href="<c:url value='/publicacao/alterar/${publicacao.idPublicacao}'></c:url>"><fmt:message key="alterar" /></a></li>
            <li><a href="<c:url value='/publicacao/apagar/${publicacao.idPublicacao}'></c:url>"><fmt:message key="apagar" /></a></li>
            </c:if>
