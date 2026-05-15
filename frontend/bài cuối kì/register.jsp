<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container" style="max-width: 500px; margin-top: 50px;">
        <h2 style="text-align: center;">Đăng Ký Tài Khoản Mới</h2>
        <form action="registerServlet" method="POST">
            <div class="form-group">
                <label>Họ và Tên</label>
                <input type="text" name="ho_ten" required>
            </div>
            <div class="form-group">
                <label>Số điện thoại</label>
                <input type="text" name="sdt" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" name="email" required>
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" class="btn-submit" style="background-color: #28a745;">Đăng Ký</button>
            <p style="text-align: center; margin-top: 15px;">
                Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
            </p>
        </form>
    </div>
</body>
</html>