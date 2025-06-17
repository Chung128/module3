<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
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
            <h2 class="mb-4 text-center">Thêm mới </h2>
            <form method="post" action="sanphams" class="row g-3">
                <input type="hidden" name="action" value="create">

                <div class="col-md-6 mb-3">
                    <label class="form-label">tên sản phẩm</label>
                    <input value="${sanpham.tensanPham}" name="tensanPham" type="text" class="form-control"
                           required>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">giá bán</label>
                    <input value="${sanpham.gia}" name="gia" type="number" class="form-control"
                           required
                           min="100.1"
                           step="0.1"
                           title="Giá nhập vào phải lớn hơn 100">
                </div>

                <select  name="mucGiamGia" class="form-select w-auto col-md-6 mb-3">
                    <option value="5">Giảm 5%</option>
                    <option value="10">Giảm 10%</option>
                    <option value="15">Giảm 15%</option>
                    <option value="20">Giảm 20%</option>
                </select>

                <div class="col-md-6 mb-3">
                    <label class="form-label">tồn kho</label>
                    <input value="${sanpham.tonKho}" name="tonKho" type="number" class="form-control"
                           required
                           min="10.1"
                           step="0.1"
                           title="Tồn kho phải lớn hơn 10 ">
                </div>

                <div class="col-12 text-center mt-4">
                    <button type="submit" class="btn btn-primary px-5 me-3">Thêm</button>
                    <a href="sanphams" class="btn btn-secondary px-4">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>