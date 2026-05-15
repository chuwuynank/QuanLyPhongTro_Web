<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Phòng - TrọNhanh</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container" style="background: white; padding: 40px; border-radius: 12px; margin-top: 30px; display: flex; gap: 40px;">
        
        <!-- Cột trái: Slider ảnh -->
        <div style="flex: 1.5;">
            <div class="slider-container" style="position: relative; overflow: hidden; border-radius: 10px;">
                <img src="${pageContext.request.contextPath}/images/demo-room.jpg" style="width: 100%; height: 450px; object-fit: cover;">
                <!-- Đây là mô phỏng nút Slider -->
                <div style="position: absolute; top: 50%; width: 100%; display: flex; justify-content: space-between; padding: 0 10px;">
                    <button style="background: rgba(0,0,0,0.5); color: white; border: none; padding: 10px;">❮</button>
                    <button style="background: rgba(0,0,0,0.5); color: white; border: none; padding: 10px;">❯</button>
                </div>
            </div>
        </div>

        <!-- Cột phải: Thông tin -->
        <div style="flex: 1;">
            <h1 style="margin-top: 0; color: #333;">Phòng trọ Cầu Giấy cực đẹp</h1>
            <p style="font-size: 32px; color: #e74c3c; font-weight: bold; margin: 10px 0;">2.500.000 VNĐ <span style="font-size: 16px; color: #666; font-weight: normal;">/ tháng</span></p>
            
            <div style="background: #f9f9f9; padding: 20px; border-radius: 8px; margin: 20px 0;">
                <p>📍 <strong>Địa chỉ:</strong> Số 10 Duy Tân, Cầu Giấy, Hà Nội</p>
                <p>📏 <strong>Diện tích:</strong> 25 m2</p>
                <p>📞 <strong>Liên hệ:</strong> <span style="color: #28a745; font-weight: bold; font-size: 18px;">0987.654.321</span></p>
            </div>

            <h3>Tiện ích phòng:</h3>
            <ul style="list-style: none; padding: 0; display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                <li>🌐 Wifi miễn phí</li>
                <li>❄️ Điều hòa mới</li>
                <li>🧺 Máy giặt riêng</li>
                <li>🚿 Nóng lạnh</li>
                <li>🛵 Chỗ để xe rộng</li>
                <li>🛡️ An ninh 24/7</li>
            </ul>

            <button class="btn-search" style="width: 100%; margin-top: 30px; height: 50px; font-size: 18px;">Liên Hệ Ngay</button>
        </div>
    </div>
</body>
</html>