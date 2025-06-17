<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>

</body>
</html>

<nav class="navbar navbar-light bg-white shadow-sm border-bottom mb-4">
  <div class="container justify-content-center">
    <span class="navbar-brand mb-0 h4 text-dark fw-bold">
      Danh sách hiện có
    </span>
  </div>
</nav>
<div class="d-flex justify-content-between align-items-center mb-3">
  <a class="btn btn-primary btn-sm" href="sanphams?action=create">Thêm mới</a>
</div>

<c:if test="${not empty param.message}">
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <c:choose>
      <c:when test="${param.message == 'deleteDeleted success'}">
        Xóa thành công!
      </c:when>
      <c:when test="${param.message == 'addSuccess'}">
        Thêm mới thành công!
      </c:when>
      <c:when test="${param.message == 'updateSuccess'}">
        Cập nhật thành công!
      </c:when>
      <c:otherwise>
        ${param.message}
      </c:otherwise>
    </c:choose>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</c:if>


<hr class="my-4">
<table id="tablePhong" class="table table-bordered table-hover mt-3">
  <thead>
  <tr>
    <th>số thứ tự</th>
    <th>tên sản phẩm</th>
    <th>giá bán</th>
    <th>mức giảm giá</th>
    <th>tồn kho</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="sanpham" items="${sanPhamList}" varStatus="count">
    <tr>
      <td>${count.count}</td>
      <td>${sanpham.tensanPham}</td>
      <td>${sanpham.gia}</td>
      <td>${sanpham.mucGiamGia}</td>
      <td>${sanpham.tonKho}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<footer class="bg-light text-center text-muted py-3 mt-auto border-top">
  <div class="container-fluid">
    <p class="mb-0 fw-bold">© 2025 - Nhóm phát triển một mình tôi.</p>
  </div>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<script>
  $('#tablePhong').dataTable({
    "dom": 'strip',            // Giao diện (l - length, r - processing, t - table, i - info, p - pagination)
    "lengthChange": false,     // Ẩn dropdown chọn số dòng/trang
    "pageLength": 7,           // Mặc định 5 dòng
    "searching": true,         // Cho phép tìm kiếm
    "ordering": true,         // Cho phép sắp xếp cột
    language: {
      paginate: {
        next: 'Trang sau',
        previous: 'Trang trước'
      },
      info: "",
      infoEmpty: "",
      infoFiltered: "",
      lengthMenu: "Hiển thị _MENU_ dòng mỗi trang",
      zeroRecords: "Không tìm thấy dữ liệu",
    }
  });
</script>
