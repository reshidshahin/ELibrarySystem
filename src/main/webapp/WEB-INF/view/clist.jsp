<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

    <title>Book List - ELibrarySystem</title>
    <s:url var="url_css" value="/static/css/style.css"/>
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
        <td height="25px" align="center">
            <%-- Menu --%>
            <jsp:include page="include/menu.jsp"/>
        </td>
    </tr>
    <tr>
        <td height="350px" valign="top" width="100%">
            <%-- Page Content Area--%>
            <div class="container" align="left">
                <br/>
                <h3>Books added by you to our Library DB</h3>
                <c:if test="${param.act eq 'sv'}">
                    <p class="success">Book Saved Successfully</p>
                </c:if>
                <c:if test="${param.act eq 'del'}">
                    <p class="success">Books Deleted Successfully</p>
                </c:if>
            </div>
            <div class="container" align="right">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <form action="<s:url value="/user/book_search"/>">
                                <input type="text" name="freeText" value="${param.freeText}"
                                       placeholder="Enter Text To Search">
                                <button class="btn btn-info">Find</button>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="container" align="left">
                <form action="<s:url value="/user/bulk_cdelete"/>">
                    <button class="btn btn-outline-danger" align="left">Delete
                        Selected Records
                    </button>
                    <br/>
                    <div class="table-responsive">
                        <br>
                        <table border="1" cellpadding="3" width="100%"
                               class="table table-striped table-hover table-bordered">
                            <tr>
                                <th>SELECT</th>
                                <th>BOOKID</th>
                                <th>BOOKNAME</th>
                                <th>AUTHOR</th>
                                <th>ISSUEDTIME</th>
                                <th>RETURNTIME</th>
                                <th>COMMENTS</th>
                                <th>ACTION</th>
                            </tr>

                            <c:if test="${empty bookList}">
                                <tr>
                                    <td align="center" colspan="8" class="error">No Records
                                        Present
                                    </td>
                                </tr>
                            </c:if>

                            <c:forEach var="c" items="${bookList}" varStatus="st">
                                <tr>
                                    <td align="center"><input type="checkbox" name="cid"
                                                              value="${c.bookId}"/></td>
                                    <td>${c.bookId}</td>
                                    <td>${c.bookName}</td>
                                    <td>${c.author}</td>
                                    <td>${c.issuedTime}</td>
                                    <td>${c.returnTime}</td>
                                    <td>${c.comments}</td>
                                    <s:url var="url_del" value="/user/del_book">
                                        <s:param name="cid" value="${c.bookId}"/>
                                    </s:url>
                                    <s:url var="url_edit" value="/user/edit_book">
                                        <s:param name="cid" value="${c.bookId}"/>
                                    </s:url>
                                    <td><a href="${url_edit}">Edit</a> | <a href="${url_del}">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </form>
            </div>
        </td>
    </tr>
    <tr>
        <td height="350px">
            <%-- Footer --%>
            <jsp:include page="include/footer.jsp"/>
        </td>
    </tr>
</table>
</body>
</html>