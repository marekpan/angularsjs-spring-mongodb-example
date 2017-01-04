<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- AngularJS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular-route.js"></script>

</head>
<body ng-app="testApp">
<div class="container" ng-controller="MainController as ctrl" ng-init="ctrl.getUsers()">
    <div class="page-header text-center">
        <ul>
            <li><i>Server side - Java. Spring Framework. Tomcat. Maven.</i></li>
            <li><i>Frontend - Javascript(AngularJS, jQuery. AJAX. JSON, JSP)</i></li>
            <li><i>Database - MongoDB.</i></li>
            <li><i>Design - HTML. CSS. Bootstrap.</i></li>
        </ul>
    </div>
    <div class="row">

        <div class="col-lg-4">
            <select multiple id="userId" class="form-control" ng-model="ctrl.selectData.currentUser"
                    ng-options="user.id as user.firstName + ' ' + user.lastName for user in ctrl.users"
                    ng-change="ctrl.getProducts()">
            </select>
        </div>
        <div class="col-lg-8">
            <div id="productTablePlace">
                <table id="productTable" class="table table-hover table-bordered">
                    <tr id="productHeadRow"><th>Название</th><th>Описание</th><th>Цена</th><th>Действия</th></tr>
                    <tr ng-repeat="product in ctrl.products.items" class="productRow">
                        <td>{{product.title}}</td>
                        <td>{{product.description}}</td>
                        <td>{{product.price}}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info" ng-click="ctrl.editWindow(product)">Edit</button>
                                <button type="button" class="btn btn-danger" ng-click="ctrl.deleteProduct(product.id)">Delete</button>
                            </div>
                        </td>
                    </tr>
                </table>
                <div ng-show="ctrl.userChoosed">
                <p id="count">Count: {{ctrl.products.count}}</p>
                <div id="addBtnPlace"><a href="#/addProduct" class="btn btn-info" role="button">Add Product</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4"></div>
        <div class="col-lg-4"><div ng-view></div></div>
    </div>
</div>
</body>

<script>
    var app = angular.module("testApp", ["ngRoute"]);
    app.config(["$routeProvider", function ($routeProvider) {
        $routeProvider.when("/addProduct", {
            templateUrl: "products/add"
        }).when("/editProduct", {
            templateUrl: "products/edit"
        })
    }]);

    app.controller("MainController", ["$http", "$routeParams", "$window", function($http, $routeParams, $window) {
        var self = this;

        self.selectData = {
            currentUser: "test"
        };

        self.getUsers = function() {
            $http.get("users/all").then(function(response) {
                self.users = response.data.items;
            });
        };

        self.getProducts = function() {
            $http.get("products/all?userId=" + self.selectData.currentUser).then(function(response) {
                self.products = {"count": response.data.count, "items": response.data.items};
            });
            self.userChoosed = true;
            $window.location.href = "#/";
        };

        self.addProduct = function() {
            /**
            $http({
                method: "POST",
                url: "products/add",
                data: {
                    title: self.addForm.title,
                    description: self.addForm.description,
                    price: self.addForm.price,
                    ownerId: self.selectData.currentUser[0]
                },
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            });
             */

            $.post("products/add", {
                    title: self.addForm.title,
                    description: self.addForm.description,
                    price: self.addForm.price,
                    ownerId: self.selectData.currentUser[0]
                }, self.getProducts);
        };

        self.deleteProduct = function(productId) {
            $.post("products/delete", {
                productId: productId
            }, self.getProducts);
        };
        
        self.editWindow = function (product) {
            alert(product.id);
            self.editPData = {
                id: product.id,
                title: product.title,
                description: product.description,
                price: product.price
            };
            $window.location.href = "#/editProduct";
        };

        self.editProduct = function () {
            alert("Edited");
            $.post("products/edit", {
                id: self.editPData.id,
                title: self.editPData.title,
                description: self.editPData.description,
                price: self.editPData.price,
                ownerId: self.selectData.currentUser[0]
            }, self.getProducts);
        };


    }]);
</script>

</html>