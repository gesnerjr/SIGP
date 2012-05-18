            <li><a href="<c:url value='/publicacao/novo'></c:url>"><fmt:message key="novo" /></a></li>
            <c:if test="${not empty publicacao.idPublicacao}">
            <li><a href="<c:url value='/publicacao/alterar/${publicacao.idPublicacao}'></c:url>"><fmt:message key="alterar" /></a></li>
            <li><a href="<c:url value='/publicacao/apagar/${publicacao.idPublicacao}'></c:url>"><fmt:message key="apagar" /></a></li>
            </c:if>
