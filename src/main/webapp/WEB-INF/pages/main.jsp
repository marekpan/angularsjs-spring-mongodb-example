<%@ page import="com.polubinskas.ajaxtest.models.AjaxResponse" %>
<%@ page import="com.polubinskas.ajaxtest.models.ProductDoc" %>
<%@ page import="com.polubinskas.ajaxtest.models.UserDoc" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<% List<UserDoc> users = (List<UserDoc>) request.getAttribute("users"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajax Test</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
           $("#userId").change(function () {
               $(".productRow").remove();
               var userId = $("#userId").val();
               $.getJSON("product/all?userId=" + userId, function(data) {
                   for(var i = 0; i<data.items.length; i++)
                   {
                       $("#productHeadRow").after(
                                 "<tr class='productRow'>"
                               + "<td>" + data.items[i].title + "</td>"
                               + "<td>" + data.items[i].description + "</td>"
                               + "<td>" + data.items[i].price + "</td></tr>"
                       )
                   }
                   $("#count").text("Всего товаров - " + data.count + ".");
               })
           });
        });
    </script>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="page-header text-center">
            <ul>
                <li><i>Server side - Java. Spring Framework. Tomcat. Maven.</i></li>
                <li><i>Frontend - Javascript. jQuery. AJAX. JSON. JSP.</i></li>
                <li><i>Database - MongoDB.</i></li>
                <li><i>Design - HTML. CSS. Bootstrap.</i></li>
            </ul>
        </div>
        <div class="col-lg-4">
            <select multiple id="userId" class="form-control">
                <% for (UserDoc user : users) { %>
                <%= "<option value='" + user.getId() + "'>" + user.getFirstName() + " " + user.getLastName() + ". "
                        + user.getCity() + ". Age: " + user.getAge() + "</option>" %>
                <% } %>
            </select>
        </div>
        <div class="col-lg-8">
            <div id="productTablePlace">
                <table id="productTable" class="table table-hover table-bordered">
                    <tr id="productHeadRow"><th>Название</th><th>Описание</th><th>Цена</th></tr>
                    </table>
                <p id="count"></p>
            </div>
            </div>
        </div>
    </div>
</body>
</html>