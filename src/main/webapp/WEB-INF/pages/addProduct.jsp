<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11.12.2016
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="page-header text-center">
        <ul>
            <li><i>Server side - Java. Spring Framework. Tomcat. Maven.</i></li>
            <li><i>Frontend - Javascript. jQuery. AJAX. JSON. JSP.</i></li>
            <li><i>Database - MongoDB.</i></li>
            <li><i>Design - HTML. CSS. Bootstrap.</i></li>
        </ul>
    </div>
    <div class="container">
        <div class="row">
            <form action="/product/add" method="POST">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" name="title" id="title"/>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description" id="description"/>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" class="form-control" name="price" id="price"/>
                </div>
                <input type="hidden" id="ownerId" name="ownerId" value="<%=request.getParameter("userId")%>"/>
                <button type="submit" class="btn btn-default">Добавить</button>
            </form>
            </div>
        </div>
    </div>
</body>
</html>
