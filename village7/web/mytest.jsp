<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/18
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="servlet1.do">
        用户名:<input type="text" name="username"><br>
        密码:<input type="password" name="password"><br>
        <input type="submit">
    </form>
    <br>
    <c:out value="jsptl"></c:out>
    <br>
    ${requestScope.username}
    <br>
    ${requestScope.errMessage}
</body>
</html>
