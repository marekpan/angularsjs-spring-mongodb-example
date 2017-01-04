<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-default">
    <div class="panel-heading">Add Product</div>
    <div class="panel-body">
<form ng-submit="ctrl.addProduct()">
    <div class="form-group">
        <label for="title">Title:</label>
        <input type="text" class="form-control" ng-model="ctrl.addForm.title" id="title"/>
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" class="form-control" ng-model="ctrl.addForm.description" name="description" id="description"/>
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="text" class="form-control" ng-model="ctrl.addForm.price" id="price"/>
    </div>
    <button type="submit" class="btn btn-default">Добавить</button>
</form>
        </div>
    </div>