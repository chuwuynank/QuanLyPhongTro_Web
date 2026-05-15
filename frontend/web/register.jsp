<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap');
        body { margin: 0; font-family: 'Plus Jakarta Sans', sans-serif; background: #e2e8f0; display: flex; justify-content: center; padding-top: 60px; }
        .card { background: white; padding: 40px; border-radius: 24px; box-shadow: 0 10px 40px rgba(0,0,0,0.1); width: 450px; max-width: 90%; }
        .input-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; color: #334155; font-size: 14px;}
        
        /* Đảm bảo TẤT CẢ các loại ô nhập liệu đều to đều nhau */
        input[type="text"], input[type="email"], input[type="password"] { 
            width: 100%; padding: 15px; border: 1.5px solid #cbd5e1; border-radius: 12px; 
            box-sizing: border-box; font-size: 15px; font-family: inherit; transition: 0.3s;
        }
        input:focus { border-color: #2ecc71; outline: none; box-shadow: 0 0 0 4px rgba(46,204,113,0.1); }
        
        .btn-submit { width: 100%; padding: 18px; background: #2ecc71; color: white; border: none; border-radius: 12px; font-size: 18px; font-weight: 800; cursor: pointer; transition: 0.3s; margin-top: 10px; box-shadow: 0 4px 15px rgba(46,204,113,0.3);}
        .btn-submit:hover { background: #27ae60; transform: translateY(-2px); }
        .error-msg { color: #e74c3c; font-size: 13px; font-weight: bold; display: block; margin-top: 5px; }
    </style>
</head>
<body>
    <div class="card">
        <h2 style="text-align: center; margin-bottom: 30px; color: #1e293b;">Đăng Ký Tài Khoản Mới</h2>
        
        <form action="${pageContext.request.contextPath}/register" method="POST" onsubmit="return validateRegisterForm()">
            <div class="input-group">
                <label>Họ và Tên</label>
                <input type="text" name="ho_ten" placeholder="Nhập họ và tên">
            </div>

            <div class="input-group">
                <label>Số điện thoại <span style="color: #e74c3c;">*</span></label>
                <input type="text" name="sdt" id="sdt_reg" placeholder="Nhập 10 số điện thoại">
                <span id="err-sdt-reg" class="error-msg"></span>
            </div>

            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="example@gmail.com">
            </div>

            <div class="input-group">
                <label>Mật khẩu</label>
                <input type="password" name="mat_khau" placeholder="Nhập mật khẩu">
            </div>

            <button type="submit" class="btn-submit">ĐĂNG KÝ</button>

            <p style="text-align: center; margin-top: 25px; font-size: 14px; color: #64748b;">
                Đã có tài khoản? <a href="${pageContext.request.contextPath}/login.jsp" style="color: #2ecc71; font-weight: bold; text-decoration: none;">Đăng nhập</a>
            </p>
        </form>
    </div>

    <script>
        function validateRegisterForm() {
            let isValid = true;
            const sdtInput = document.getElementById("sdt_reg");
            const sdtError = document.getElementById("err-sdt-reg");

            sdtError.innerText = "";
            sdtInput.style.borderColor = "#cbd5e1";

            if (sdtInput.value.trim() === "") {
                sdtError.innerText = "⚠️ Bạn bắt buộc phải nhập số điện thoại!";
                sdtInput.style.borderColor = "#e74c3c";
                isValid = false;
            } else if (!/^[0-9]{10}$/.test(sdtInput.value)) {
                sdtError.innerText = "⚠️ Số điện thoại phải đúng 10 chữ số!";
                sdtInput.style.borderColor = "#e74c3c";
                isValid = false;
            }
            return isValid;
        }
    </script>
</body>
</html>