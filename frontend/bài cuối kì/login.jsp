<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập - Quản Lý Phòng Trọ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container" style="max-width: 400px; margin-top: 50px;">
        <h2 style="text-align: center;">Đăng Nhập</h2>
        <form action="loginServlet" method="POST">
            <div class="form-group">
                <label>Tên đăng nhập hoặc Email</label>
                <input type="text" name="username" placeholder="Nhập tài khoản..." required>
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu..." required>
            </div>
            <button type="submit" class="btn-submit">Đăng Nhập</button>
            <p style="text-align: center; margin-top: 15px;">
                Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
            </p>
        </form>
    </div>
</body>
</html>