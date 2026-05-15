<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Trị (Admin)</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 15px; margin-bottom: 30px;}
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #343a40; color: white; }
    </style>
</head>
<body>
    <div class="container" style="max-width: 1000px; margin-top: 20px;">
        <h2>Bảng Điều Khiển Admin</h2>
        
        <h3>Quản lý Loại Phòng</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Loại Phòng</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Phòng trọ</td>
                    <td><a href="#" style="color: blue;">Sửa</a> | <a href="#" style="color: red;">Xóa</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Chung cư mini</td>
                    <td><a href="#" style="color: blue;">Sửa</a> | <a href="#" style="color: red;">Xóa</a></td>
                </tr>
            </tbody>
        </table>

        <h3>Quản lý Người Dùng</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ Tên</th>
                    <th>Vai Trò</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>U01</td>
                    <td>Trí Dũng</td>
                    <td>Admin</td>
                    <td><strong style="color: gray;">Không thể xóa</strong></td>
                </tr>
                <tr>
                    <td>U02</td>
                    <td>Nguyễn Văn A</td>
                    <td>Chủ trọ</td>
                    <td><a href="#" style="color: red;">Khóa tài khoản</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>