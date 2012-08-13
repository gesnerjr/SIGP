	<div id="admin-box" class="sidebar-box">
        <h3>Admin Box</h3>
        <ul class="sidebar-menu arrows">
            <li><a href="<c:url value='/login/add'></c:url>">Add new user</a></li>
        
<c:choose>
	<c:when test="${headername == 'index' or empty headername}">
	</c:when>
	
	<c:when test="${headername == 'linha'}">
	   <jsp:include page="/WEB-INF/jsp/linhaDePesquisa/admin-box.jsp" />
	</c:when>
	
	<c:when test="${headername == 'projeto'}">
	   <jsp:include page="/WEB-INF/jsp/projeto/admin-box.jsp" />
	</c:when>
	
	<c:when test="${headername == 'publicacao'}">
	   <jsp:include page="/WEB-INF/jsp/publicacao/admin-box.jsp" />
	</c:when>
	
	<c:when test="${headername == 'software'}">
        <jsp:include page="/WEB-INF/jsp/software/admin-box.jsp" />
    </c:when>
	
	<c:when test="${headername == 'membro'}">
	   <jsp:include page="/WEB-INF/jsp/contribuinte/admin-box.jsp" />
	</c:when>
</c:choose>
        </ul>
    </div><!-- end sidebar-box -->  