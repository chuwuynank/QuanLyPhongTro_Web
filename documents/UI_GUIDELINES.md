# YÊU CẦU THIẾT KẾ GIAO DIỆN (FRONTEND)

Anh em phụ trách Frontend (HTML/CSS/JS/JSP) chú ý dựng đúng các màn hình sau và tuân thủ quy tắc nhập liệu để không bị lỗi khi gọi xuống Database.

## 1. Danh sách màn hình cần có (Views)

* **Trang chủ (`index.jsp`):** Gồm thanh tìm kiếm (Combobox: Tỉnh/Thành, Quận/Huyện, Mức giá, Diện tích) và danh sách các phòng trọ đang cho thuê (dạng thẻ/card).
* **Trang Đăng nhập / Đăng ký (`login.jsp`, `register.jsp`):** Form có đầy đủ các ô tương ứng với bảng NguoiDung.
* **Trang Chi tiết phòng (`room-detail.jsp`):** Có Slider cuộn ảnh, hiển thị giá tiền nổi bật, thông tin liên hệ chủ trọ và danh sách tiện ích (dùng icon cho đẹp).
* **Trang Đăng tin phòng (`add-room.jsp`):** Form dài nhất, cho phép nhập text, chọn tiện ích bằng Checkbox và nút Upload file ảnh.
* **Dashboard Chủ trọ (`host-dashboard.jsp`):** Giao diện bảng (Table) liệt kê các phòng đã đăng. Có các nút hành động: Sửa, Ẩn bài (Xóa mềm), Đổi trạng thái (Đã thuê).
* **Trang Quản trị Admin (`admin.jsp`):** Giao diện bảng để Admin thêm/sửa/xóa các danh mục (Loại phòng, Tiện ích) và xem danh sách User.

## 2. Quy chuẩn Form Nhập liệu (Bắt buộc khớp DB)

* **Nhập số:** Các ô Giá thuê (`gia_thue`) và Diện tích (`dien_tich`) bắt buộc dùng `<input type="number" min="1">` để chặn nhập chữ và số âm.
* **Nhập text ẩn:** Các ô mật khẩu phải dùng `<input type="password">`.
* **Lựa chọn:** Các trường như Trạng thái phòng, Loại phòng phải dùng thẻ `<select>` (Dropdown) để người dùng chọn, không cho gõ tay để tránh sai chính tả.
* **Upload:** Nút chọn ảnh phải giới hạn chỉ nhận file hình: `<input type="file" accept="image/png, image/jpeg" multiple>`.

## 3. Validate (Bắt lỗi bằng JavaScript)

* Bắt buộc hiển thị chữ đỏ cảnh báo "Không được bỏ trống" nếu người dùng quên điền các ô quan trọng (Tiêu đề, Địa chỉ, Số điện thoại).
* Chặn nút "Submit" nếu Giá thuê hoặc Diện tích <= 0.
* Số điện thoại phải kiểm tra đúng định dạng (chỉ chứa số, khoảng 10 ký tự).
