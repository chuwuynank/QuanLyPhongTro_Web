function validateForm() {
    let isValid = true;

    // Lấy giá trị các ô
    let tieuDe = document.getElementById("tieu_de").value.trim();
    let diaChi = document.getElementById("dia_chi").value.trim();
    let sdt = document.getElementById("sdt").value.trim();
    let giaThue = document.getElementById("gia_thue").value;
    let dienTich = document.getElementById("dien_tich").value;

    // Xóa thông báo lỗi cũ
    document.querySelectorAll('.error-msg').forEach(e => e.innerText = "");

    // 1. Kiểm tra rỗng
    if (tieuDe === "") {
        document.getElementById("err-tieu-de").innerText = "Tiêu đề không được bỏ trống!";
        isValid = false;
    }
    if (diaChi === "") {
        document.getElementById("err-dia-chi").innerText = "Địa chỉ không được bỏ trống!";
        isValid = false;
    }

    // 2. Kiểm tra số điện thoại (chỉ số, đúng 10 ký tự)
    let phonePattern = /^[0-9]{10}$/;
    if (!phonePattern.test(sdt)) {
        document.getElementById("err-sdt").innerText = "Số điện thoại phải bao gồm đúng 10 chữ số!";
        isValid = false;
    }

    // 3. Kiểm tra Giá và Diện tích (Phải > 0)
    if (giaThue <= 0) {
        document.getElementById("err-gia").innerText = "Giá thuê phải lớn hơn 0!";
        isValid = false;
    }
    if (dienTich <= 0) {
        document.getElementById("err-dien-tich").innerText = "Diện tích phải lớn hơn 0!";
        isValid = false;
    }

    // Nếu isValid là false, form sẽ bị chặn lại không gửi đi
    return isValid;
}