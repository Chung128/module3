<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Sửa phòng</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-image: url('https://cdn.brvn.vn/editor_news/2017/09/13441TGDD9_1505320123.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: center;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-container {
      background-color: rgba(255, 255, 255, 0.6);
      border-radius: 12px;
      padding: 30px;
      margin-top: 50px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      width: 40%;
    }

    h2 {
      text-align: center;
      color: #333;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-10 form-container">
      <h2 class="mb-4">Cập Nhật Thông Tin Sản Phẩm</h2>
      <form method="post" action="products" class="row g-3">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${product.id}" />
        <div>
          <label class="form-label">Tên sản phẩm</label>
          <input class="form-control" name="name"  value="${product.name}">
        </div>
        <div>
          <label class="form-label">Giá bán</label>
          <input class="form-control" name="price" type="number" value="${product.price}">
        </div>
        <div>
          <label class="form-label">Mô tả sản phẩm</label>
          <input class="form-control" name="describe" type="text" value="${product.describe}">
        </div>
        <div>
          <label class="form-label">Nhà sản xuất</label>
          <input class="form-control" name="manufacturer" type="text"  value="${product.manufacturer}">
        </div>
        <select name="category">
          <option>----------chon loại sản phẩm------------</option>
          <c:forEach items="${categoryList}" var="ctg">
            <option value="${ctg.idCategory}">${ctg.nameCategory}</option>
          </c:forEach>
        </select>
        <div class="col-12 text-center mt-4">
          <button class="btn btn-primary px-5" type="submit">Cập nhật</button>
          <a href="products" class="btn btn-secondary px-4 ms-3">Quay lại</a>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
