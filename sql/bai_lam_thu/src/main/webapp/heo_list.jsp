<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <title>Quản lý phòng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body class="container py-4">
<div class="d-flex justify-content-between align-items-center mb-3">
  <button class="btn btn-secondary" onclick="window.location.href='/heos'"><h3 class="mb-0">Danh sách phòng hiện có</h3></button>
  <a class="btn btn-primary btn-sm" href="heos?action=create">Thêm mới phòng</a>
</div>

<c:if test="${not empty param.message}">
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <c:choose>
      <c:when test="${param.message == 'deleteDeleted success'}">
        Xóa phòng thành công!
      </c:when>
      <c:when test="${param.message == 'addSuccess'}">
        Thêm mới phòng thành công!
      </c:when>
      <c:when test="${param.message == 'updateSuccess'}">
        Cập nhật phòng thành công!
      </c:when>
      <c:otherwise>
        ${param.message}
      </c:otherwise>
    </c:choose>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</c:if>

<form action="/heos" method="get">
  <input name="action" hidden="hidden"  value="search">
  <input name="searchName" placeholder="Nhập mã heo" value="${searchName}">
  <select name="maTinhTrang">
    <option value="0">--Chọn tình trạng---</option>
    <c:forEach items="${listTinhTrang}" var="lp">
      <c:if test="${lp.maTinhTrang==maTinhTrang}">
        <option value="${lp.maTinhTrang}" selected>${lp.tenTinhTrang}</option>
      </c:if>
      <c:if test="${lp.maTinhTrang!=maTinhTrang}">
        <option value="${lp.maTinhTrang}">${lp.tenTinhTrang}</option>
      </c:if>
    </c:forEach>
  </select>
  <select hidden="hidden" name="maXuatXu">
    <option value="0">--Chọn xuất xứ---</option>
    <c:forEach items="${maXuatXu}" var="tt">
      <c:if test="${tt.maXuatXu == maXuatXu}">
        <option value="${tt.maXuatXu}" selected>${tt.xuatXu}</option>
      </c:if>
      <c:if test="${tt.maXuatXu != maXuatXu}">
        <option value="${tt.maXuatXu}">${tt.xuatXu}</option>
      </c:if>
    </c:forEach>
  </select>
  <button>Tìm kiếm</button>
</form>

<hr class="my-4">
<table id="tablePhong" class="table table-bordered table-hover mt-3">
  <thead>
  <tr>
    <th>số thứ tự</th>
    <th>mã khánh heo</th>
    <th>thời gian khi nhập</th>
    <th>cân nặng khi nhập</th>
    <th>thời gian xuất</th>
    <th>cân nặng khi xuất</th>
    <th>tình trạng bán</th>
    <th>xuất xứ</th>
    <th>Hành động</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="heo" items="${heoList}" varStatus="count">
    <tr>
      <td>${count.count}</td>
      <td>${heo.maSoHeo}</td>
      <td>${heo.thoiGianNhapChuong}</td>
        <td>${heo.canNangNhapChuong}</td>
        <td>${heo.thoiGianxuatChuong}</td>
        <td>${heo.canNangXuatChuong}</td>
      <td>
        <c:forEach var="trangThai1" items="${listTinhTrang}">
          <c:if test="${trangThai1.maTinhTrang==heo.maTinhTrang}">
            ${trangThai1.tenTinhTrang}
          </c:if>
        </c:forEach>
      </td>
      <td>
        <c:forEach var="xuatXu" items="${listXuatXu}">
          <c:if test="${xuatXu.maXuatXu==heo.maXuatXu}">
            ${xuatXu.xuatXu}
          </c:if>
        </c:forEach>
      </td>
      <td>
        <a href="heos?action=update&id=${heo.idHeo}" class="btn btn-warning btn-sm">Sửa</a>
        <button onclick="deleteInfo('${heo.idHeo}','${heo.maSoHeo}')" type="button"
                class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
          Xóa
        </button>
        <a href="phongs?action=detail&id=${heo.idHeo}" class="btn btn-primary btn-sm">Chi tiết</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form method="post" action="/heos?action=delete">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Chức năng xóa</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input hidden="hidden" id="deleteId" name="deleteId">
          <span>Bạn có muốn xoá heo có mã số</span><span id="deleteName"></span> không?
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
  $('#tablePhong').dataTable({
    "dom": 'strip',            // Giao diện (l - length, r - processing, t - table, i - info, p - pagination)
    "lengthChange": false,     // Ẩn dropdown chọn số dòng/trang
    "pageLength": 5,           // Mặc định 5 dòng
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
</body>
</html>
