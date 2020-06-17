<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Login - ELibrarySystem</title>
    <s:url var="url_css" value="/static/css/style.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
            integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
            crossorigin="anonymous"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
            integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
            crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
          crossorigin="anonymous">

    <link href="${url_css}" rel="stylesheet" type="text/css"/>


</head>

<s:url var="url_bg" value="/static/images/img.jpg"/>
<body background="${url_bg}">
<table width="80%" align="center">
    <tr>
        <td height="80px">
            <%-- Header --%>
            <jsp:include page="include/header.jsp"/>
        </td>
    </tr>

    <tr>
        <td height="45px" align="center">
            <%-- Menu --%>
            <jsp:include page="include/menu.jsp"/>
        </td>
    </tr>

    <tr>
        <td height="350px" valign="top" align="center">
            <%-- Page Content Area--%>

            <div class="container" align="center">
                <br>
                <h3>User Login</h3>
                <c:if test="${err!=null}">
                    <p class="error">${err}</p>
                </c:if>
                <c:if test="${param.act eq 'lo'}">
                    <p class="success">Logout Successfully! Thanks for using our
                        application.</p>
                </c:if>
                <c:if test="${param.act eq 'reg'}">
                    <p class="success">User Registered Successfully. Please login</p>
                </c:if>
                <s:url var="url_login" value="/login"/>
                <f:form action="${url_login}" modelAttribute="command">

                    <table align="center">
                        <tr>
                            <td>Username</td>
                            <div>
                                <td><f:input type="text" path="loginName"
                                             class="form-control"/></td>
                            </div>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <div>
                                <td><f:password path="password" class="form-control"/></td>
                            </div>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <button class="btn btn-primary">Login</button>
                                <br/> <a
                                    href="<s:url value="/reg_form"/>">New User Registration</a>
                            </td>
                        </tr>
                    </table>

                </f:form>
            </div>

        </td>
    </tr>

    <tr>
        <td height="350">
            <%-- Footer --%>
            <jsp:include page="include/footer.jsp"/>
        </td>
    </tr>
</table>
</body>
</html>
