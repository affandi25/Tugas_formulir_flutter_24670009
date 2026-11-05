# 🎨 Design System & UI Specification
## Aplikasi Formulir Registrasi Mahasiswa Baru (EduPortal)

---

### 1. Filosofi Desain
Desain mengadopsi estetika **Organic Minimalist & Modern Clean** berdasarkan referensi visual yang diberikan, dengan penyesuaian aksen tema akademik:
* **Bersih & Terbuka**: Penggunaan ruang putih/off-white yang lega (*whitespace*) agar formulir tidak terasa padat atau melelahkan.
* **Sudut Lembut (Smooth Rounded)**: Komponen input field dan tombol memiliki radius `16.0` hingga `24.0` yang memberikan kesan modern, ramah, dan bersahabat.
* **Aksen Akademik**: Mengganti elemen daun dengan **Ikon Toga (`Icons.school_rounded`)** yang ditempatkan secara anggun di bagian atas (*header*).

---

### 2. Token Warna (Color Palette)

| Kategori | Token Name | Hex Code | Visual Preview / Keterangan |
| :--- | :--- | :--- | :--- |
| **Primary** | `primaryGreen` | `#2D6A4F` | Warna utama tombol, ikon aktif, dan aksen |
| **Primary Dark** | `primaryDarkGreen`| `#1B4332` | Warna teks judul utama dan header |
| **Primary Light**| `primaryLightGreen`| `#D8F3DC` | Latar belakang badge ikon toga & chip aktif |
| **Background** | `appBackground` | `#F8FAF8` | Warna latar belakang seluruh layar |
| **Surface/Field**| `inputFieldBg` | `#F1F4F2` | Warna dasar abu-abu lembut untuk input box |
| **Text Primary** | `textPrimary` | `#1E2824` | Warna teks utama, label input, judul |
| **Text Secondary**| `textSecondary` | `#74837B` | Warna hint, subtitle, dan teks pendukung |
| **Border / Line**| `borderSubtle` | `#E3E8E4` | Garis pemisah atau batas luar halus |
| **Error** | `errorRed` | `#D90429` | Warna pesan validasi error |
| **Success** | `successGreen` | `#2D6A4F` | Warna status berhasil pada dialog |

---

### 3. Tipografi (Typography Scale)

| Nama Gaya | Ukuran Font | Ketebalan (Weight) | Warna Default | Penggunaan |
| :--- | :--- | :--- | :--- | :--- |
| **Headline Large** | `26.0` | `FontWeight.w700` | `primaryDarkGreen` | Judul Halaman ("Registrasi Mahasiswa") |
| **Subtitle Medium** | `14.0` | `FontWeight.w400` | `textSecondary` | Keterangan di bawah judul ("Lengkapi data diri...") |
| **Section Label** | `14.0` | `FontWeight.w600` | `textPrimary` | Label di atas radio/checkbox ("Jenis Kelamin", "Hobi") |
| **Input Text** | `15.0` | `FontWeight.w400` | `textPrimary` | Teks yang diketik pengguna di dalam field |
| **Input Hint** | `14.0` | `FontWeight.w400` | `textSecondary` | Placeholder panduan input ("Masukkan Nama Lengkap") |
| **Button Text** | `16.0` | `FontWeight.w600` | `Colors.white` | Teks pada tombol utama ("Daftar Sekarang") |
| **Error Text** | `12.0` | `FontWeight.w500` | `errorRed` | Pesan teks validasi error |

---

### 4. Dimensi & Elevasi (Spacing & Shape Tokens)

* **Border Radius**:
  * Input Fields: `BorderRadius.circular(16.0)`
  * Primary Button: `BorderRadius.circular(16.0)`
  * Container Cards: `BorderRadius.circular(16.0)`
  * Summary Dialog: `BorderRadius.circular(24.0)`
  * Header Badge: `BorderRadius.circular(30.0)`
* **Spacing Scale**:
  * Extra Small (XS): `4.0`
  * Small (S): `8.0`
  * Medium (M): `16.0`
  * Large (L): `24.0`
  * Extra Large (XL): `32.0`
* **Input Field Padding**:
  * Horizontal: `18.0`
  * Vertical: `16.0`

---

### 5. Spesifikasi Komponen Khusus

#### 5.1 Header Widget
* Badge lingkaran dengan latar `#D8F3DC` berdiameter `64px`.
* Ikon Toga (`Icons.school_rounded`) berukuran `36px` dengan warna `#2D6A4F`.
* Teks judul "Registrasi Mahasiswa" dengan jarak 12px ke subtitle.

#### 5.2 Input Field Reusable
* `filled: true`, `fillColor: Color(0xFFF1F4F2)`.
* Tidak ada garis tepi gelap (borderless secara default menggunakan `OutlineInputBorder.none` atau border warna tipis saat fokus).
* Ikon prefix di sebelah kiri dengan warna `textSecondary` (`0xFF74837B`).

#### 5.3 Radio Button Group (Jenis Kelamin)
* Ditata berdampingan secara horizontal dalam dua kartu/container terpisah yang rapi.
* Saat dipilih, kartu memiliki aksen batas hijau dan latar hijau sangat muda.

#### 5.4 Checkbox Group (Hobi)
* Disusun rapi dalam 2 kolom atau daftar kartu minimalis.
* Checkbox bertema warna `primaryGreen`.

#### 5.5 Tombol Utama (Primary Action)
* Tinggi tombol minimal: `54.0`.
* Latar warna: `primaryGreen` (`#2D6A4F`).
* Teks putih tebal dengan efek visual ripple saat disentuh.

