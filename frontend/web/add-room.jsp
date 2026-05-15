<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Tin Phòng Trọ - TrọNhanh</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap');
        body { margin: 0; font-family: 'Plus Jakarta Sans', sans-serif; background: #e2e8f0; display: flex; flex-direction: column; align-items: center; padding-top: 80px; }
        
        /* THANH HEADER */
        .header-minimal { position: fixed; top: 0; left: 0; width: 100%; display: flex; justify-content: space-between; align-items: center; padding: 20px 40px; box-sizing: border-box; z-index: 1000; background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .header-minimal a { text-decoration: none; color: #64748b; font-weight: 600; font-size: 15px; transition: 0.3s; }
        .header-minimal a:hover { color: #2ecc71; }
        .nav-right { display: flex; gap: 25px; }
        
        /* FORM ĐĂNG TIN */
        .container { background: white; width: 800px; max-width: 95%; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); margin-bottom: 40px; }
        h2 { color: #2ecc71; border-bottom: 2px solid #2ecc71; padding-bottom: 15px; margin-top: 0; margin-bottom: 30px; font-size: 28px;}
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; color: #334155; margin-bottom: 8px; font-size: 15px;}
        .asterisk { color: #e74c3c; font-weight: bold; } 
        input[type="text"], input[type="number"], select { width: 100%; padding: 15px; border: 1.5px solid #cbd5e1; border-radius: 10px; box-sizing: border-box; font-size: 15px; font-family: inherit; transition: 0.3s; }
        input:focus { border-color: #2ecc71; outline: none; box-shadow: 0 0 0 4px rgba(46,204,113,0.1); }
        .btn-submit { width: 100%; padding: 18px; background: #2ecc71; color: white; border: none; border-radius: 12px; font-size: 20px; font-weight: 800; cursor: pointer; transition: 0.3s; margin-top: 25px; box-shadow: 0 4px 15px rgba(46,204,113,0.3); }
        .btn-submit:hover { background: #27ae60; transform: translateY(-3px); }
        .custom-file-upload { display: block; padding: 16px 25px; cursor: pointer; background-color: #f8fafc; border: 2px dashed #94a3b8; border-radius: 12px; color: #475569; font-weight: bold; text-align: center; font-size: 16px; transition: 0.3s; }
        .custom-file-upload:hover { border-color: #2ecc71; color: #2ecc71; background-color: #f0fdf4; }
        input[type="file"] { display: none; } 
        .file-name { margin-top: 8px; font-size: 14px; color: #64748b; font-style: italic; text-align: center; }
        .error-msg { color: #e74c3c; font-size: 13px; font-weight: bold; display: block; margin-top: 5px; }
        .row { display: flex; gap: 20px; } .col { flex: 1; }
    </style>
</head>
<body>
    <header class="header-minimal">
        <a href="${pageContext.request.contextPath}/index.jsp">⬅ Quay về</a>
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
            <a href="${pageContext.request.contextPath}/register.jsp" style="color: #2ecc71;">Đăng ký</a>
        </div>
    </header>

    <div class="container">
        <h2>Đăng Tin Phòng Trọ Mới</h2>
        <form action="${pageContext.request.contextPath}/addRoom" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label>Tiêu đề bài đăng <span class="asterisk">*</span></label>
                <input type="text" name="tieu_de" placeholder="Ví dụ: Phòng trọ Cầu Giấy cực đẹp...">
            </div>
            <div class="row form-group">
                <div class="col">
                    <label>Giá thuê (VNĐ) <span class="asterisk">*</span></label>
                    <input type="number" name="gia_thue" min="1">
                </div>
                <div class="col">
                    <label>Diện tích (m2) <span class="asterisk">*</span></label>
                    <input type="number" name="dien_tich" min="1">
                </div>
            </div>
            <div class="form-group">
                <label>Số điện thoại liên hệ <span class="asterisk">*</span></label>
                <input type="text" name="sdt" placeholder="Nhập 10 chữ số...">
            </div>
            <div class="form-group">
                <label>Địa chỉ cụ thể <span class="asterisk">*</span></label>
                <input type="text" name="dia_chi">
            </div>
            <div class="form-group" style="margin-top: 30px;">
                <label>Hình ảnh phòng (PNG/JPEG) <span class="asterisk">*</span></label>
                <label for="anh_phong" class="custom-file-upload" id="file-label">📁 <span>Chọn hình ảnh</span></label>
                <input type="file" name="anh_phong" id="anh_phong" accept="image/png, image/jpeg" multiple onchange="updateFileName()">
                <div id="file-name" class="file-name">Chưa có hình ảnh nào được chọn</div>
            </div>
            <button type="submit" class="btn-submit">Đăng Tin Ngay</button>
        </form>
    </div>

    <script>
        function updateFileName() {
            const input = document.getElementById('anh_phong');
            const fileNameDisplay = document.getElementById('file-name');
            if (input.files.length > 0) {
                fileNameDisplay.innerText = "Đã chọn " + input.files.length + " hình ảnh";
                fileNameDisplay.style.color = "#2ecc71";
            }
        }
    </script>
</body>
</html>