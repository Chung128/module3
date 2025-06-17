<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <!-- Bootstrap CSS -->
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
            <h2 class="mb-4">Thêm phòng mới</h2>
            <form method="post" action="heos" class="row g-3">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id_heo" value="${heo.idHeo}">
                <div>
                    <label class="form-label">Mã con heo</label>
                    <input value="${heo.maSoHeo}" name="ma_so_heo" class="form-control" required
                           pattern="^MH-[A-Z0-9]{3}$"
                           title="Mã bài học phải có định dạng: MH-XXX (X là chữ in hoa hoặc số)">
                </div>
                <div>
                    <label class="form-label">thời gian nhập chuồng</label>
                    <input value="${heo.thoiGianNhapChuong}" name="thoi_gian_nhap_chuong" type="text" class="form-control" required>
                </div>
                <div>
                    <label class="form-label"> cân nặng khi nhập chuồng</label>
                    <input value="${heo.canNangNhapChuong}" name="can_nang_nhap_chuong" type="text" class="form-control" required>
                </div>
                <div>
                    <label class="form-label">thơi gian xuất chuồng</label>
                    <input value="${heo.thoiGianxuatChuong}" name="thoi_gian_xuat_chuong" type="text"  class="form-control" required>
                </div>
                <div>
                    <label class="form-label">cân nặng heo khi xuất chuồng</label>
                    <input value="${heo.canNangXuatChuong}" name="can_nang_xuat_chuong" type="text"  class="form-control" required>
                </div>
                <select name="ma_tinh_trang">
                    <c:forEach items="${listTinhTrang}" var="trangThai">
                        <c:choose>
                            <c:when test="${trangThai.maTinhTrang == heo.maTinhTrang}">
                                <option value="${trangThai.maTinhTrang}" selected>${trangThai.tenTinhTrang}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${trangThai.maTinhTrang}">${trangThai.tenTinhTrang}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <select name="ma_xuat_xu">
                    <c:forEach items="${listXuatXu}" var="loaiPhong">
                        <c:choose>
                            <c:when test="${loaiPhong.maXuatXu == heo.maXuatXu}">
                                <option value="${loaiPhong.maXuatXu}" selected>${loaiPhong.xuatXu}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${loaiPhong.maXuatXu}">${loaiPhong.xuatXu}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <div class="col-12 text-center mt-4">
                    <button type="submit" class="btn btn-primary px-5">Sửa</button>
                    <a class="btn btn-secondary" href="/heos">Quay lại danh sách</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
