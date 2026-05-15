<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Chủ Trọ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Bảng Quản Lý Phòng Của Bạn</h2>
        <table class="data-table" style="width: 100%; border-collapse: collapse; margin-top: 20px;">
            <thead>
                <tr style="background: #28a745; color: white;">
                    <th style="padding: 12px;">Mã phòng</th>
                    <th>Tiêu đề</th>
                    <th>Giá (VNĐ)</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #ddd; text-align: center;">
                    <td style="padding: 12px;">PT001</td>
                    <td>Chung cư mini cao cấp Cầu Giấy</td>
                    <td>2.500.000</td>
                    <td><span style="color: green;">Đang trống</span></td>
                    <td>
                        <button style="background: orange; color: white; border: none; padding: 5px 10px; border-radius: 4px;">Sửa</button>
                        <button style="background: gray; color: white; border: none; padding: 5px 10px; border-radius: 4px;">Ẩn bài</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>