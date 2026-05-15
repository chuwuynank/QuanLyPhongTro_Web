<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Hệ Thống Tìm Trọ</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap');
        body { margin: 0; font-family: 'Plus Jakarta Sans', sans-serif; background: #f4f7f6; color: #334155; }
        
        /* Navbar */
        .navbar { background: white; padding: 15px 40px; display: flex; justify-content: flex-end; align-items: center; box-shadow: 0 2px 15px rgba(0,0,0,0.05); position: sticky; top: 0; z-index: 1000;}
        .navbar a { text-decoration: none; color: #64748b; font-weight: 600; margin-left: 30px; transition: 0.3s; }
        .navbar a:hover { color: #2ecc71; }
        
        /* Hero Section (Ảnh nền và Form tìm kiếm) */
        .hero-section { 
            height: 550px; 
            display: flex; flex-direction: column; justify-content: center; align-items: center; 
            text-align: center; color: white;
            /* Đảm bảo ảnh nền không bị lặp lại và phủ kín */
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.4)), url('${pageContext.request.contextPath}/images/demo-room.jpg') no-repeat center center / cover; 
        }
        .hero-section h1 { font-size: 3.5rem; margin-bottom: 30px; font-weight: 800; text-shadow: 0 4px 10px rgba(0,0,0,0.3); }
        
        /* Thanh tìm kiếm nằm ngang */
        .search-bar { 
            background: white; padding: 10px; border-radius: 100px; 
            display: flex; gap: 10px; width: 900px; max-width: 95%; 
            box-shadow: 0 15px 40px rgba(0,0,0,0.2); 
        }
        .search-bar select { 
            flex: 1; padding: 15px 20px; border: none; background: transparent; 
            font-size: 15px; font-weight: 600; color: #475569; outline: none; 
            border-right: 1px solid #e2e8f0; font-family: inherit; width: auto;
        }
        .search-bar select:last-of-type { border-right: none; }
        .btn-search { 
            background: #2ecc71; color: white; border: none; padding: 0 40px; 
            border-radius: 50px; font-weight: 800; font-size: 16px; 
            cursor: pointer; transition: 0.3s; 
        }
        .btn-search:hover { background: #27ae60; transform: translateY(-2px); }

        /* Danh sách phòng */
        .container { max-width: 1100px; margin: 50px auto; padding: 0 20px; }
        .room-card { background: white; padding: 30px; border-radius: 20px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); }
        .room-card h3 { margin-top: 0; color: #1e293b; font-size: 24px;}
        .price { color: #e74c3c; font-size: 1.4rem; font-weight: bold; }
        .link-detail { color: #2ecc71; text-decoration: none; font-weight: bold; font-size: 16px; }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/index.jsp" style="color: #2ecc71;">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/add-room.jsp">Đăng tin</a>
        <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
        <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
    </nav>

    <header class="hero-section">
        <h1>Hệ Thống Tìm Phòng Trọ Nhanh</h1>
        <form action="${pageContext.request.contextPath}/search" method="GET" class="search-bar">
            <select name="tinh_thanh">
                <option value="">Chọn Tỉnh/Thành</option>
                <option value="HN">Hà Nội</option>
                <option value="HCM">TP. Hồ Chí Minh</option>
            </select>
            <select name="quan_huyen">
                <option value="">Chọn Quận/Huyện</option>
                <option value="CG">Cầu Giấy</option>
                <option value="DD">Đống Đa</option>
            </select>
            <select name="muc_gia">
                <option value="">Mức giá</option>
                <option value="1">Dưới 3 triệu</option>
                <option value="2">3 - 5 triệu</option>
            </select>
            <button type="submit" class="btn-search">Tìm Kiếm</button>
        </form>
    </header>

    <main class="container">
        <div class="room-card">
            <h3>Phòng trọ Cầu Giấy cực đẹp</h3>
            <p class="price">2.500.000 VNĐ</p>
            <p style="color: #64748b;">Diện tích: 25m2 | Có điều hòa, nóng lạnh</p>
            <a href="${pageContext.request.contextPath}/room-detail.jsp" class="link-detail">Xem chi tiết →</a>
        </div>
    </main>
</body>
</html>