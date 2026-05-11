# ĐẶC TẢ USE CASE & YÊU CẦU KỸ THUẬT (DỰ ÁN QUẢN LÝ PHÒNG TRỌ)

Tài liệu này đặc tả chi tiết các Use Case để Frontend dựng Form và Backend viết xử lý Logic (DAO/Servlet). Yêu cầu anh em code bám sát cấu trúc CSDL đã chốt.

## 1. Hệ thống Tác nhân (Actors)
* **Người thuê (Guest/User):** Khách vãng lai hoặc người đã đăng nhập, có nhu cầu tìm kiếm và xem phòng trọ.
* **Chủ trọ:** Đăng bài, quản lý phòng trọ của mình, cập nhật trạng thái phòng.
* **Admin:** Quản lý toàn bộ hệ thống danh mục và người dùng.

---

## 2. Nhóm Use Case: Quản lý Tài khoản (Áp dụng cho mọi Role)

| Mã UC | Tên Use Case | Dữ liệu đầu vào (Frontend Form) | Xử lý Backend & Database (Logic) |
| :--- | :--- | :--- | :--- |
| **UC-01** | Đăng ký tài khoản | `tai_khoan`, `mat_khau`, `ho_ten`, `so_dien_thoai`, Chọn Role (Chủ trọ/Người thuê) | - Validate: Bắt buộc nhập đủ.<br>- Logic DB: Check trùng `tai_khoan`, `so_dien_thoai` (Bắt lỗi UNIQUE). `INSERT` vào bảng `NguoiDung`. |
| **UC-02** | Đăng nhập | `tai_khoan`, `mat_khau` | - Logic DB: Query bảng `NguoiDung`. Sai báo lỗi.<br>- Thành công: Lưu Session, lấy `ma_vaitro` để phân quyền điều hướng giao diện. |
| **UC-03** | Cập nhật thông tin | `ho_ten`, `so_dien_thoai`, mật khẩu mới (nếu đổi) | - Logic DB: `UPDATE` bảng `NguoiDung` theo `ma_nguoidung`. Nếu đổi SĐT phải check trùng SĐT. |

---

## 3. Nhóm Use Case: Người thuê (Khách)

| Mã UC | Tên Use Case | Dữ liệu đầu vào (Frontend Form) | Xử lý Backend & Database (Logic) |
| :--- | :--- | :--- | :--- |
| **UC-04** | Tìm kiếm & Lọc phòng | Các Combobox lọc: Tỉnh/Huyện/Xã, Khoảng giá, Diện tích, Loại phòng | - Logic DB: `SELECT` bảng `PhongTro` kết hợp `JOIN` bảng `DiaChi` và `LoaiPhong`.<br>- **Ràng buộc:** Chỉ hiển thị phòng có `trang_thai = 'con_trong'`. |
| **UC-05** | Xem chi tiết phòng | Click vào 1 phòng (truyền `ma_phong`) | - Logic DB: Query thông tin phòng từ `PhongTro`.<br>- `JOIN` bảng `HinhAnh` lấy danh sách ảnh.<br>- `JOIN` bảng `Phong_TienIch` & `TienIch` để in ra các tiện ích (Wifi, Điều hòa...). |

---

## 4. Nhóm Use Case: Nghiệp vụ Chủ trọ (Core System)

| Mã UC | Tên Use Case | Dữ liệu đầu vào (Frontend Form) | Xử lý Backend & Database (Logic) |
| :--- | :--- | :--- | :--- |
| **UC-06** | Đăng tin phòng mới | `tieu_de`, `mo_ta`, `gia_thue`, `dien_tich`, `ma_loaiphong`, data `DiaChi`, danh sách `ma_tienich`, file Ảnh. | - **Validate (Rất quan trọng):** `gia_thue` > 0 và `dien_tich` > 0.<br>- **Logic DB (Dùng Transaction):** `INSERT` bảng `DiaChi` -> Lấy `ma_diachi` -> `INSERT` bảng `PhongTro` -> Lấy `ma_phong` -> `INSERT` bảng `Phong_TienIch` và bảng `HinhAnh`. |
| **UC-07** | Sửa thông tin phòng | Các trường như form Đăng tin | - Logic DB: Nhận `ma_phong` -> `UPDATE` dữ liệu bảng `PhongTro` và `DiaChi`. Xóa và insert lại bảng `Phong_TienIch` nếu có đổi. |
| **UC-08** | Xóa phòng (Soft Delete)| Nút "Xóa" trên danh sách phòng | - **KHÔNG DÙNG LỆNH DELETE CODE HARD**. <br>- Logic DB: `UPDATE PhongTro SET trang_thai = 'da_xoa' WHERE ma_phong = ?`. |
| **UC-09** | Cập nhật trạng thái | Dropdown chuyển trạng thái ("Còn trống" / "Đã thuê") | - Logic DB: `UPDATE` cột `trang_thai` trong bảng `PhongTro` (`con_trong` <=> `da_thue`). |

---

## 5. Nhóm Use Case: Quản trị hệ thống (Admin)

| Mã UC | Tên Use Case | Dữ liệu đầu vào (Frontend Form) | Xử lý Backend & Database (Logic) |
| :--- | :--- | :--- | :--- |
| **UC-10** | Quản lý Loại phòng | `ten_loaiphong`, `mo_ta` | - Logic DB: `INSERT/UPDATE/DELETE` bảng `LoaiPhong`. Check `UNIQUE` tên loại phòng. |
| **UC-11** | Quản lý Tiện ích | `ten_tienich`, `mo_ta`, `icon` | - Logic DB: `INSERT/UPDATE/DELETE` bảng `TienIch`. Check `UNIQUE` tên tiện ích. |
| **UC-12** | Quản lý Người dùng | Nút khóa/mở khóa tài khoản | - Logic DB: Đọc danh sách từ bảng `NguoiDung`. Có thể thay đổi quyền hoặc khóa tài khoản vi phạm. |

---
**📌 Lời nhắn nhủ:**
* **Team Frontend:** Nhớ làm validate (bắt lỗi) kỹ các trường bắt buộc, giá tiền, diện tích bằng JavaScript trước khi gửi data xuống cho Backend.
* **Team Backend:** Ở `UC-06`, khi Insert nhiều bảng liên tiếp, nhớ dùng Transaction. Lỡ lưu lỗi ở bảng HinhAnh thì phải Rollback lại để không bị rác dữ liệu ở bảng PhongTro.
