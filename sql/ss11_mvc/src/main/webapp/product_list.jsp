<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý phòng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <style>
        body{
            /*background-image: url("https://cdn.brvn.vn/editor_news/2017/09/13441TGDD9_1505320123.jpg");*/
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Segoe UI', sans-serif;
        }
        table{
            background-color: rgba(255, 255, 255, 0.6);
        }
    </style>

</head>
<body class="container py-4">
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="mb-0">Danh sách phòng hiện có</h3>
    <a class="btn btn-secondary btn-sm" href="products?action=create">Thêm mới phòng</a>
</div>

<hr class="my-4">
<table class="table table-bordered table-hover mt-3">
    <tr>
        <th>số thứ tự </th>
        <th>Tên sản phẩm</th>
        <th>Giá mỗi tháng (VNĐ)</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Cập nhật</th>
        <th>Xóa </th>
    </tr>
    <tbody>
    <c:forEach var="products" items="${productList}">
        <tr>
            <td>${products.id}</td>
            <td>${products.name}</td>
            <td>${products.price}</td>
            <td>${products.describe}</td>
            <td>${products.manufacturer}</td>
            <td>
                <a href="products?action=update&id=${products.id}" class="btn btn-warning btn-sm">Sửa</a>
            </td>
            <td>
                <button onclick="deleteInfo('${products.id}','${products.name}')" type="button"
                        class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="/products?action=delete">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" id="deleteId" name="deleteId">
                    <span>Bạn có muốn xoá sản phẩm </span><span id="deleteName"></span> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button  class="btn btn-primary">Xoá</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value= id;
        document.getElementById("deleteName").innerText= name;
    }
</script>
</body>
</html>
