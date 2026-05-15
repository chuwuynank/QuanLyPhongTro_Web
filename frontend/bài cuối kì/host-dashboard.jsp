<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Quản Lý Phòng Đăng</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #007bff; color: white; }
        .btn-sm { padding: 5px 10px; border: none; color: white; cursor: pointer; border-radius: 3px; margin-right: 5px; }
        .btn-edit { background-color: #ffc107; color: black; }
        .btn-hide { background-color: #dc3545; }
        .btn-status { background-color: #17a2b8; }
    </style>
</head>
<body>
    <div class="container" style="max-width: 1000px; margin-top: 20px;">
        <h2>Xin chào Chủ trọ: Nguyễn Văn A</h2>
        <a href="add-room.jsp" class="btn-submit" style="display: inline-block; width: auto; background: #28a745;">+ Đăng tin mới</a>
        
        <table>
            <thead>
                <tr>
                    <th>Mã Phòng</th>
                    <th>Tiêu đề</th>
                    <th>Giá Thuê</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>PT001</td>
                    <td>Phòng trọ Cầu Giấy cực đẹp</td>
                    <td>2.500.000 đ</td>
                    <td><strong style="color: green;">Còn trống</strong></td>
                    <td>
                        <button class="btn-sm btn-edit">Sửa</button>
                        <button class="btn-sm btn-status">Đã thuê</button>
                        <button class="btn-sm btn-hide">Ẩn tin</button>
                    </td>
                </tr>
                <tr>
                    <td>PT002</td>
                    <td>Chung cư mini nội thất cơ bản</td>
                    <td>3.500.000 đ</td>
                    <td><strong style="color: red;">Đã thuê</strong></td>
                    <td>
                        <button class="btn-sm btn-edit">Sửa</button>
                        <button class="btn-sm btn-status">Trống lại</button>
                        <button class="btn-sm btn-hide">Ẩn tin</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>