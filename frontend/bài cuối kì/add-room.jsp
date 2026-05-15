<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Tin Phòng Trọ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Đăng Tin Cho Thuê Phòng</h2>
        <form action="submitRoom" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
            
            <div class="form-group">
                <label>Tiêu đề bài đăng *</label>
                <input type="text" id="tieu_de" name="tieu_de" placeholder="VD: Phòng trọ giá rẻ cho sinh viên">
                <span class="error-msg" id="err-tieu-de"></span>
            </div>

            <div class="form-group">
                <label>Địa chỉ *</label>
                <input type="text" id="dia_chi" name="dia_chi" placeholder="Số nhà, ngõ, đường...">
                <span class="error-msg" id="err-dia-chi"></span>
            </div>

            <div class="form-group">
                <label>Số điện thoại liên hệ *</label>
                <input type="text" id="sdt" name="sdt" placeholder="Nhập 10 số di động">
                <span class="error-msg" id="err-sdt"></span>
            </div>

            <div class="form-row">
                <div class="form-group half">
                    <label>Giá thuê (VNĐ/tháng) *</label>
                    <input type="number" id="gia_thue" name="gia_thue" min="1" placeholder="Ví dụ: 2000000">
                    <span class="error-msg" id="err-gia"></span>
                </div>
                <div class="form-group half">
                    <label>Diện tích (m2) *</label>
                    <input type="number" id="dien_tich" name="dien_tich" min="1" placeholder="Ví dụ: 20">
                    <span class="error-msg" id="err-dien-tich"></span>
                </div>
            </div>

            <div class="form-group">
                <label>Loại phòng</label>
                <select name="loai_phong">
                    <option value="Phòng trọ">Phòng trọ</option>
                    <option value="Chung cư mini">Chung cư mini</option>
                    <option value="Nhà nguyên căn">Nhà nguyên căn</option>
                </select>
            </div>

            <div class="form-group">
                <label>Tiện ích (Chọn nhiều)</label>
                <div class="checkbox-group">
                    <label><input type="checkbox" name="tien_ich" value="Wifi"> Wifi miễn phí</label>
                    <label><input type="checkbox" name="tien_ich" value="DieuHoa"> Điều hòa</label>
                    <label><input type="checkbox" name="tien_ich" value="MayGiat"> Máy giặt</label>
                    <label><input type="checkbox" name="tien_ich" value="ChoDeXe"> Chỗ để xe</label>
                </div>
            </div>

            <div class="form-group">
                <label>Tải ảnh lên (Chỉ nhận JPG, PNG)</label>
                <input type="file" name="hinh_anh" accept="image/png, image/jpeg" multiple>
            </div>

            <button type="submit" class="btn-submit">Đăng Tin Ngay</button>
        </form>
    </div>

    <script src="js/validate.js"></script>
</body>
</html>