<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach items="${contribuintes}" var="contrib" varStatus="loop">
{"id":"${contrib.idContribuinte}","name":"${contrib.nome} (${contrib.nomeCitacao})"}${!loop.last ? ',' : ''}
</c:forEach>
]