# NhaTroTot - Backend

Backend cho website tìm và cho thuê phòng trọ sử dụng **NestJS + Prisma + MySQL**.

## ✨ Tính năng chính

- Xác thực người dùng (Register / Login) với JWT
- Quản lý phòng trọ (CRUD)
- Tìm kiếm + lọc phòng theo quận, giá, từ khóa...
- Phân quyền (Tenant / Landlord / Admin)
- Transaction khi tạo phòng
- Swagger API Documentation

---

## 🚀 Hướng dẫn cài đặt & chạy

### 1. Cài đặt dependencies

```bash
npm install
2. Cấu hình Database
Tạo file .env ở thư mục gốc với nội dung sau:
env# Database
DATABASE_URL="mysql://root:your_password@localhost:3306/nhatrotot"

# JWT
JWT_SECRET=nhatrotot-super-secret-key-2026

# Port
PORT=3000
Lưu ý: Thay your_password bằng mật khẩu MySQL của bạn.
3. Tạo Database và Migrate
Bash# Tạo database nhatrotot trên MySQL trước (nếu chưa có)

# Generate Prisma Client
npx prisma generate

# Đẩy schema lên database
npx prisma db push

# (Tùy chọn) Mở giao diện xem database
npx prisma studio
4. Chạy Backend
Bash# Chạy ở chế độ development (khuyến nghị)
npm run start:dev
Server sẽ chạy tại: http://localhost:3000
Swagger UI (xem API): http://localhost:3000/api

📌 Các API chính
Auth

POST /auth/register — Đăng ký tài khoản
POST /auth/login — Đăng nhập

Rooms

GET /rooms — Lấy danh sách phòng (có filter)
GET /rooms/:id — Xem chi tiết phòng
POST /rooms — Đăng phòng mới (cần JWT)
DELETE /rooms/:id — Xóa phòng (cần JWT + là owner)

Query params hỗ trợ filter:

search — Tìm theo tiêu đề/mô tả
district — Lọc theo quận
minPrice, maxPrice — Lọc theo giá
roomTypeId


📁 Cấu trúc thư mục chính
textsrc/
├── modules/
│   ├── auth/
│   ├── rooms/
├── prisma/
│   └── prisma.service.ts
├── common/
│   └── guards/
│       └── jwt-auth.guard.ts
├── dto/
└── main.ts

🛠 Công nghệ sử dụng

NestJS
Prisma ORM
MySQL
JWT Authentication
Class-validator
Swagger


⚠️ Lưu ý quan trọng

Luôn chạy npx prisma generate sau khi sửa schema.prisma
Tạo thư mục uploads/rooms để lưu ảnh (nếu dùng upload sau này)
Hiện tại route tạo phòng yêu cầu JWT → phải login trước và gửi token trong header Authorization: Bearer <token>
Password được hash bằng bcrypt

