<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<br/>
<s:url var="url_logout" value="/logout"/>

<c:if test="${sessionScope.userId==null}">
    <%-- User is not yet logged in : Guest Menu --%>
    <s:url var="url_reg_form" value="/reg_form"/>
    <br/>
    <s:url var="url_index" value="/index"/>
    <a href="${url_index}">Home</a> | <a href="${url_index}">Login</a> | <a href="${url_reg_form}">Register</a> | <a href="#">About</a> | <a href="#">Help</a>   
</c:if>
<c:if test="${sessionScope.userId!=null && sessionScope.role == 1}">
    <%-- Admin is logged in : Admin Menu --%>    
    
    <a href="<s:url value="/admin/dashboard"/>">Home</a> | <a href="<s:url value="/admin/users"/>">User List</a> | <a href="<s:url value="/admin/books"/>">All Book List</a> | <a href="${url_logout}">Logout</a>
</c:if>
<br/>
<c:if test="${sessionScope.userId!=null && sessionScope.role == 2}">
    <%-- General User is logged in : User Menu --%>
    <s:url var="url_uhome" value="/user/dashboard"/>
    <s:url var="url_bform" value="/user/book_form"/>
    <s:url var="url_clist" value="/user/clist"/>
    <s:url var="url_order" value="/user/order"/>
    <a href="${url_uhome}">Home Page</a> | <a href="${url_order}">Order Book</a> | <a href="${url_bform}">Add Book</a> | <a href="${url_clist}">Book List</a> | <a href="${url_logout}">Logout</a>
</c:if>



