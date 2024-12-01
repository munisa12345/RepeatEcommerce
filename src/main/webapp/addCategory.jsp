<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/1/2024
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Category</title>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="text-center p-4 border rounded-3" style="background-color: #f8f9fa;">
        <h2>Add Category</h2>
        <form action="/category/add" method="post">
            <input type="text" class="form-control mb-3" placeholder="Category name" name="categoryName" required>
            <button type="submit" class="btn btn-dark w-100">Save</button>
        </form>
    </div>
</div>
</body>
</html>

