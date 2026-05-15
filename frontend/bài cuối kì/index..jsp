<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Quản Lý Phòng Trọ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>Hệ Thống Tìm Phòng Trọ Nhanh</h1>
        <!-- Bộ lọc tìm kiếm -->
        <form class="search-bar" action="search" method="GET">
            <select name="tinh_thanh">
                <option value="">Chọn Tỉnh/Thành</option>
                <option value="Hà Nội">Hà Nội</option>
                <option value="TP.HCM">TP.HCM</option>
            </select>
            <select name="quan_huyen">
                <option value="">Chọn Quận/Huyện</option>
                <option value="Cầu Giấy">Cầu Giấy</option>
                <option value="Đống Đa">Đống Đa</option>
            </select>
            <select name="muc_gia">
                <option value="">Mức giá</option>
                <option value="1-2">1 - 2 Triệu</option>
                <option value="2-4">2 - 4 Triệu</option>
            </select>
            <button type="submit">Tìm Kiếm</button>
        </form>
    </header>

    <main class="room-list">
        <!-- Card 1 -->
        <div class="room-card">
            <img src="images/demo-room.jpg" alt="Phòng trọ" style="width: 100%; height: 200px; background: #eee;">
            <div class="card-content">
                <h3>Phòng trọ Cầu Giấy cực đẹp</h3>
                <p class="price">2.500.000 VNĐ</p>
                <p>Diện tích: 25m2</p>
                <a href="room-detail.jsp" class="btn-detail">Xem chi tiết</a>
            </div>
        </div>
    </main>
</body>
</html>