<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <style>
        body {
            /*background-image: url("https://cdn.brvn.vn/editor_news/2017/09/13441TGDD9_1505320123.jpg");*/
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Segoe UI', sans-serif;
        }

        table {
            background-color: rgba(255, 255, 255, 0.6);
        }
    </style>

</head>
<body class="container py-4">
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="mb-0">Danh sách sản phẩm hiện có</h3>
    <a class="btn btn-secondary btn-sm" href="products?action=create">Thêm mới sản phẩm</a>
</div>

<hr class="my-4">
<table id="tableProduct" class="table table-bordered table-hover mt-3">
    <thead>
    <tr>
        <th>Số thứ tự</th>
        <th>Mã sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Giá mỗi tháng (VNĐ)</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Mã loại sản phẩm</th>
        <th>Tác vụ</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="products" items="${productList}" varStatus="pro">
        <tr>
            <td>${pro.count}</td>
            <td>${products.id}</td>
            <td>${products.name}</td>
            <td><fmt:formatNumber value="${products.price}" type="number" groupingUsed="true"/>
            <td>${products.describe}</td>
            <td>${products.manufacturer}</td>
            <td>${products.category}</td>
            <td>
                <a href="products?action=update&id=${products.id}" class="btn btn-warning btn-sm">Sửa</a>
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
                    <button class="btn btn-primary">Xoá</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<script>
    $('#tableProduct').dataTable({
        "dom": 'lrtip',            // Giao diện (l - length, r - processing, t - table, i - info, p - pagination)
        "lengthChange": false,     // Ẩn dropdown chọn số dòng/trang
        "pageLength": 5,           // Mặc định 5 dòng
        "searching": true,         // Cho phép tìm kiếm
        "ordering": true           // Cho phép sắp xếp cột
    });
</script>
</body>
</html>
