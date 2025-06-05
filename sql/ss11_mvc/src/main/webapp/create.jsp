<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Thêm mới phòng</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-image: url('https://anviethouse.vn/wp-content/uploads/2021/06/Thiet-ke-shop-dien-thoai-1-5.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: center;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-container {
      background-color: rgba(255, 255, 255, 0.95);
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
      <h2 class="mb-4">Thêm sản phẩm mới</h2>
      <form method="post" action="products" class="row g-3">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="id">
        <div>
          <label class="form-label">Tên sản phẩm</label>
          <input name="name" class="form-control" required>
        </div>
        <div>
          <label class="form-label">giá bán</label>
          <input name="price" type="number" class="form-control" required>
        </div>
        <div>
          <label class="form-label">Mô tả sản phẩm</label>
          <input name="describe" type="text" class="form-control" required>
        </div>
        <div>
          <label class="form-label">Nhà sản xuất</label>
          <input name="manufacturer" type="text"  class="form-control" required>
        </div>
        <div class="col-12 text-center mt-4">
          <button type="submit" class="btn btn-primary px-5">Thêm phòng</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
