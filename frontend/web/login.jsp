<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập - TrọNhanh</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap');
        body { margin: 0; font-family: 'Plus Jakarta Sans', sans-serif; background: #e2e8f0; }
        .modal-overlay { position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.5); display: flex; justify-content: center; align-items: center; }
        .modal-content { background: white; width: 900px; max-width: 95%; height: 550px; border-radius: 20px; display: flex; overflow: hidden; box-shadow: 0 20px 40px rgba(0,0,0,0.2); }
        .modal-left { flex: 1; background: linear-gradient(135deg, rgba(46,204,113,0.85), rgba(39,174,96,0.9)), url('${pageContext.request.contextPath}/images/demo-room.jpg') center/cover; color: white; padding: 40px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; }
        .modal-left h2 { font-size: 32px; margin-bottom: 15px; font-weight: 800; }
        .modal-right { flex: 1.2; padding: 40px 50px; background: white; position: relative; display: flex; flex-direction: column; justify-content: center; }
        .close-btn { position: absolute; top: 15px; right: 25px; font-size: 30px; color: #94a3b8; text-decoration: none; font-weight: bold; }
        .close-btn:hover { color: #e74c3c; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; font-weight: 600; font-size: 14px; margin-bottom: 8px; color: #334155; }
        .input-group input { width: 100%; padding: 14px 15px; border: 1.5px solid #cbd5e1; border-radius: 10px; box-sizing: border-box; font-size: 15px; transition: 0.3s; font-family: inherit; }
        .input-group input:focus { border-color: #2ecc71; outline: none; box-shadow: 0 0 0 4px rgba(46,204,113,0.1); }
        .btn-submit { width: 100%; padding: 16px; background: #2ecc71; color: white; border: none; border-radius: 10px; font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.3s; margin-top: 10px; }
        .btn-submit:hover { background: #27ae60; transform: translateY(-2px); }
    </style>
</head>
<body>
    <div class="modal-overlay">
        <div class="modal-content">
            <div class="modal-left">
                <h2>Xin chào bạn!</h2>
                <p>Tìm kiếm phòng trọ, chung cư mini nhanh chóng, tiện lợi và uy tín hiện nay.</p>
            </div>

            <div class="modal-right">
                <a href="javascript:history.back()" class="close-btn" title="Đóng">&times;</a>
                <h2 style="margin-top: 0; color: #1e293b; font-size: 26px; margin-bottom: 25px;">Đăng Nhập</h2>
                
                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="input-group">
                        <label>Tên đăng nhập</label>
                        <input type="text" name="ten_dang_nhap" placeholder="Nhập tên tài khoản" required>
                    </div>
                    <div class="input-group">
                        <label>Mật khẩu</label>
                        <input type="password" name="mat_khau" placeholder="Nhập mật khẩu" required>
                    </div>
                    
                    <button type="submit" class="btn-submit">ĐĂNG NHẬP</button>
                    
                    <p style="text-align: center; margin-top: 25px; font-size: 14px; color: #64748b;">
                        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register.jsp" style="color: #2ecc71; font-weight: bold; text-decoration: none;">Đăng ký ngay</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>