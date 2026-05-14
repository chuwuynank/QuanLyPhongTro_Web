# Hướng dẫn chạy Database cho project Lập Trình Web

Anh em làm theo các bước sau để dựng Database chuẩn bị code nhé:

### Bước 1: Đăng nhập SQL Server Management Studio (SSMS)
Anh em mở SSMS lên và đăng nhập với thông tin chung của nhóm:
- **Authentication:** SQL Server Authentication
- **Login (User name):** `sa`
- **Password:** `MatKhauMoi123!`

### Bước 2: Chạy file Script tạo Database
1. Lấy file script `.sql` trong thư mục `database/` của repo này về máy.
2. Kéo thả file đó vào cửa sổ SSMS.
3. Bấm **Execute** (hoặc phím F5) để chạy. (Script đã bao gồm tự tạo DB, tạo 10 bảng đúng chuẩn 3NF và đổ sẵn data mẫu).

### Bước 3: Cấu hình kết nối trong Java (JDBC)
Anh em dùng thông tin sau để set up chuỗi kết nối trong code nhé (nhớ check lại port nếu máy anh em không dùng port mặc định 1433):
- **URL:** `jdbc:sqlserver://localhost:1433;databaseName=QuanLyPhongTro;`
- **User:** `sa`
- **Password:** `MatKhauMoi123!`

**⚠️ Lưu ý cực kỳ quan trọng:**
TUYỆT ĐỐI không tự ý đổi tên bảng, tên cột hay xóa bớt các ràng buộc (CHECK, UNIQUE) trong Database để tránh việc lúc ghép code bị lỗi "vênh" dữ liệu nhé.
