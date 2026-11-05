# 📋 Rencana & Desain Spesifikasi Formulir Pendaftaran Mahasiswa

Dokumen ini merupakan panduan implementasi untuk tugas akhir praktikum Flutter Forms (Slide 19). Desain visual mengadopsi konsep **Modern Clean & Aesthetic** sesuai gambar referensi yang dipilih, dengan penyesuaian ikon toga/akademik.

---

## 🎨 1. Konsep & Desain Visual
* **Warna Utama**: Hijau Botani / Emerald Gelap (`#234E3B` / `#2D6A4F`).
* **Warna Latar**: Off-white lembut (`#F8FAF8`).
* **Field Input**: Warna abu-abu terang lembut (`#F1F4F2`), tanpa garis tepi kaku, sudut melengkung 16px (`BorderRadius.circular(16)`).
* **Ikon Header**: Ikon Toga Akademik (`Icons.school_rounded`) dengan badge lingkaran aksen hijau.

---

## 📝 2. Pemetaan Komponen Form & Validasi (Sesuai Slide 19)

| No | Komponen / Field | Tipe Widget | Tipe Input / Opsi | Aturan Validasi |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Header** | `Column` + `Icon` | Ikon Toga + Judul "Registrasi Mahasiswa" | - |
| 2 | **Nama Lengkap** | `TextFormField` | Text biasa, prefix icon `person_outline` | Wajib diisi (tidak boleh kosong atau hanya spasi) |
| 3 | **NIM** | `TextFormField` | `TextInputType.number`, prefix icon `badge_outlined` | Wajib diisi, harus angka, minimal 8 digit |
| 4 | **Email** | `TextFormField` | `TextInputType.emailAddress`, prefix icon `mail_outline` | Wajib diisi, format email valid (`@` & domain) |
| 5 | **Password** | `TextFormField` | `obscureText: true`, suffix icon mata (toggle) | Wajib diisi, minimal 8 karakter |
| 6 | **Jenis Kelamin** | `RadioListTile` (Custom Card) | "Laki-laki" & "Perempuan" | Wajib dipilih |
| 7 | **Hobi** | `Checkbox` (Multi-select) | "Membaca", "Musik", "Olahraga", "Fotografi" | Minimal memilih 1 hobi |
| 8 | **Program Studi** | `DropdownButtonFormField` | Pilihan: Teknik Informatika, Sistem Informasi, Bisnis Digital, Pendidikan TI | Wajib dipilih |
| 9 | **Syarat & Ketentuan** | `CheckboxListTile` | "Saya menyetujui syarat & ketentuan" | Wajib dicentang |
| 10 | **Tombol Simpan** | `ElevatedButton` | Button hijau rounded ("Daftar Sekarang") | Memeriksa validasi seluruh form |

---

## 🗂️ 3. Tampilan Ringkasan Data (Dialog Hasil)
Setelah seluruh validasi lolos:
* Menampilkan dialog modal (`AlertDialog`) berisi:
  * Icon centang sukses (`Icons.check_circle_rounded`) warna hijau.
  * Ringkasan data pendaftar (Nama, NIM, Email, Jenis Kelamin, Program Studi, Hobi).
  * Tombol konfirmasi / tutup.

---

## 🚀 4. Struktur File Proyek
```
lib/
├── main.dart             # Entry point aplikasi & konfigurasi tema
└── registration_form.dart # Widget halaman formulir lengkap & dialog ringkasan
```

