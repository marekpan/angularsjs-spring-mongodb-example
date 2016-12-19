<%@ page import="com.polubinskas.ajaxtest.models.AjaxResponse" %>
<%@ page import="com.polubinskas.ajaxtest.models.ProductDoc" %>
<%@ page import="com.polubinskas.ajaxtest.models.UserDoc" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.polubinskas.ajaxtest.routes.AppRoutes" %>
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

            var userId;

            function showProducts(data) {
                for(var i = 0; i<data.items.length; i++)
                {
                    $("#productHeadRow").after(
                            "<tr class='productRow'>"
                            + "<td>" + data.items[i].title + "</td>"
                            + "<td>" + data.items[i].description + "</td>"
                            + "<td>" + data.items[i].price + "</td>"
                            + "<td><div class='btn-group'>" +
                            "<button type='button' data-product-id='" + data.items[i].id + "' class='btn btn-primary editBtn'>Редактировать</button>" +
                            "<button type='button' data-product-id='" + data.items[i].id + "' class='btn btn-danger deleteBtn'>Удалить</button>" +
                            "</div></td></tr>"
                    )
                }

                $("#count").text("Всего товаров - " + data.count + ".");
                $("#addBtnPlace").html('<a href="product/add?userId=' + userId + '" class="btn btn-info" role="button">Добавить товар</a>');
            }

            function getProducts() {
                $(".productRow").remove();
                userId = $("#userId").val();
                $.getJSON("product/all?userId=" + userId, showProducts);
            }

           $("#userId").change(getProducts);

            $(document).on("click", ".deleteBtn", function() {
                if(confirm("Вы уверены что хотите удалить?")) {
                    var productId = $(this).attr("data-product-id");
                    $.post("product/delete", {"productId": productId}, getProducts);
                }
            })
            
            $(document).on("click", ".editBtn", function () {
                window.location = "<%= AppRoutes.PRODUCT_EDIT%>?productId=" + $(this).attr("data-product-id") + "&userId=" + userId;
            })

        });
    </script>
</head>
<body>
<div class="container">
     <div class="page-header text-center">
            <ul>
                <li><i>Server side - Java. Spring Framework. Tomcat. Maven.</i></li>
                <li><i>Frontend - Javascript. jQuery. AJAX. JSON. JSP.</i></li>
                <li><i>Database - MongoDB.</i></li>
                <li><i>Design - HTML. CSS. Bootstrap.</i></li>
            </ul>
        </div>
        <div class="row">

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
                    <tr id="productHeadRow"><th>Название</th><th>Описание</th><th>Цена</th><th>Действия</th></tr>
                    </table>
                <p id="count"></p>
                <div id="addBtnPlace"></div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>