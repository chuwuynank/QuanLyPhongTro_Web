// Cho trang Đăng Tin
function validateRoomForm() {
    let isValid = true;
    const tieuDe = document.getElementById("tieu_de");
    const sdt = document.getElementById("sdt");
    const errTieuDe = document.getElementById("err-tieu-de");
    const errSdt = document.getElementById("err-sdt");

    if (tieuDe.value.trim() === "") {
        errTieuDe.innerText = "⚠️ Tiêu đề không được để trống!";
        isValid = false;
    } else { errTieuDe.innerText = ""; }

    if (!/^[0-9]{10}$/.test(sdt.value)) {
        errSdt.innerText = "⚠️ Số điện thoại phải là 10 chữ số!";
        isValid = false;
    } else { errSdt.innerText = ""; }

    return isValid;
}

// Cho trang Đăng Ký - Bắt lỗi chữ đỏ
function validateRegisterForm() {
    let isValid = true;
    const sdt = document.getElementById("sdt_reg");
    const errSdt = document.getElementById("err-sdt-reg");

    if (sdt.value.trim() === "") {
        errSdt.innerText = "⚠️ Bạn bắt buộc phải nhập số điện thoại!";
        sdt.style.borderColor = "#e74c3c";
        isValid = false;
    } else if (!/^[0-9]{10}$/.test(sdt.value)) {
        errSdt.innerText = "⚠️ Số điện thoại phải có đúng 10 chữ số!";
        sdt.style.borderColor = "#e74c3c";
        isValid = false;
    } else {
        errSdt.innerText = "";
        sdt.style.borderColor = "#e2e8f0";
    }
    return isValid;
}