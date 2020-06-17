<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration - ELibrarySystem</title>
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

    <s:url var="url_css" value="/static/css/style.css"/>
    <link href="${url_css}" rel="stylesheet" type="text/css"/>
    <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js"/>
    <script src="${url_jqlib}"></script>
    <script>
        $(document).ready(function () {
            $("#id_check_avail").click(function () {
                $.ajax({
                    url: 'check_avail',
                    data: {
                        username: $("#id_username").val()
                    },
                    success: function (data) {
                        $("#id_res_div").html(data);
                    }
                });
            });
        });
    </script>
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
        <td height="25px" align="center">
            <%-- Menu --%>
            <jsp:include page="include/menu.jsp"/>
        </td>
    </tr>

    <tr>
        <td height="350px" valign="top" align="center" width="100%">
            <%-- Page Content Area--%>
            <div class="container" align="center">
                <br>
                <h3>User Registration</h3>
                <c:if test="${err!=null}">
                    <p class="error">${err}</p>
                </c:if>
                <s:url var="url_reg" value="/register"/>
                <f:form action="${url_reg}" modelAttribute="command">
                <table>
                    <tr>
                        <td>Name</td>
                        <div>
                            <td><f:input type="text" class="form-control"
                                         path="user.name"/></td>
                        </div>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <div>
                            <td><f:input type="text" class="form-control"
                                         path="user.phone"/></td>
                        </div>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <div>
                            <td><f:input type="email" class="form-control"
                                         path="user.email" placeholder="name@example.com"/></td>
                        </div>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <div>
                            <td><f:textarea path="user.address" class="form-control"/></td>
                        </div>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <div>
                            <td><f:input id="id_username" path="user.loginName"
                                         class="form-control"/>
                        </div>
                        <button type="button" id="id_check_avail">Check
                            Availability
                        </button>
                        <div id="id_res_div" class="error"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <div>
                            <td><f:password class="form-control" path="user.password"/></td>
                        </div>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <button class="btn btn-primary">Submit</button>
                            <br/>
                        </td>
                    </tr>

                    </f:form>
                    </td>
                </table>
            </div>
    </tr>

    <div>
        <tr>
            <td height="350">
                <%-- Footer --%>
                <jsp:include page="include/footer.jsp"/>
            </td>
        </tr>
    </div>
</table>
</body>
</html>
