<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/1/2024
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Add Product</title>
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center mb-4">Add Product</h2>

  <form action="/product/add" method="post" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;" >

    <div class="mb-3">
      <label for="productImg" class="form-label">Product Image</label>
      <input name="productImage" type="file" class="form-control" id="productImg" accept="image/*" required>
    </div>

    <div class="mb-3">
      <label for="productName" class="form-label">Product Name</label>
      <input name="name" type="text" class="form-control" id="productName" placeholder="Enter product name" required>
    </div>

    <div class="mb-3">
      <label for="productPrice" class="form-label">Product Price</label>
      <input name="price" type="number" class="form-control" id="productPrice" placeholder="Enter product price" min="0" step="0.01" required>
    </div>

    <div class="mb-3">
      <label for="categoryId" class="form-label">Category id</label>
      <input name="categoryId" type="number" class="form-control" id="categoryId" placeholder="Enter category Id" min="0" step="0.01" required>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-dark">Save</button>
    </div>
  </form>
</div>
</body>
</html>
