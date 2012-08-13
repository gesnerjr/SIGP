<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${locale}" scope="session"/>
            <li><a href="<c:url value='/software/novo'></c:url>"><fmt:message key="novo" /></a></li>
            <c:if test="${not empty software.idSoftware}">
            <li><a href="<c:url value='/software/alterar/${software.idSoftware}'></c:url>"><fmt:message key="alterar" /></a></li>
            <li><a href="<c:url value='/software/apagar/${software.idSoftware}'></c:url>"><fmt:message key="apagar" /></a></li>
            </c:if>
