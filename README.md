# 🌱 RePoints - Aplikasi Manajemen Sampah Berbasis Poin

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Aplikasi pengelolaan sampah berbasis poin untuk mahasiswa Institut Teknologi PLN**  
> Mendorong kesadaran lingkungan melalui sistem reward dan gamification

---

## 📱 Tentang Aplikasi

**RePoints** adalah aplikasi mobile inovatif yang mengubah cara mahasiswa berinteraksi dengan pengelolaan sampah. Dengan menggabungkan teknologi Flutter dan konsep gamification, aplikasi ini memberikan insentif nyata bagi mahasiswa untuk aktif dalam menjaga kebersihan lingkungan kampus.

### 🎯 Visi & Misi

**Visi:**  
Menjadi solusi digital terdepan dalam pengelolaan sampah berkelanjutan di lingkungan kampus

**Misi:**

- Meningkatkan kesadaran mahasiswa tentang pentingnya daur ulang
- Memfasilitasi sistem reward yang adil dan transparan
- Menciptakan ekosistem kampus yang bersih dan ramah lingkungan
- Memberikan edukasi berkelanjutan tentang pengelolaan sampah

### 💡 Konsep Bisnis

RePoints menerapkan model **Circular Economy** dengan sistem poin:

1. **Setor Sampah** → Mahasiswa menyetorkan sampah daur ulang (plastik, kertas, logam, kaca)
2. **Dapatkan Poin** → Sistem menghitung poin berdasarkan berat dan jenis sampah
3. **Tukar Reward** → Poin dapat ditukar dengan voucher, merchandise, dan benefit kampus
4. **Monitor Kontribusi** → Tracking statistik dan dampak lingkungan secara real-time
5. **Belajar & Berkembang** → Akses edukasi tentang daur ulang dan kelestarian

### 🎓 Target Pengguna

- **Mahasiswa Institut Teknologi PLN**: Pengguna utama yang aktif menyetor sampah
- **Civitas Akademika**: Dosen dan staff yang mendukung program lingkungan
- **Pengelola Kampus**: Administrator yang memantau dan mengelola sistem
- **Komunitas Lingkungan**: Partner dalam kampanye kebersihan kampus

---

## ✨ Fitur Utama

### 🔐 1. Autentikasi & Profil User

**Login & Registrasi yang Personal**

- Login dengan email institusi
- Registrasi lengkap dengan data mahasiswa (NIM, Jurusan, Fakultas)
- Nama user otomatis tampil di Home dan Profile
- Session management yang aman
- Logout dengan konfirmasi

**Profil Dinamis:**

- Data lengkap: Nama, Email, No. HP, Jurusan
- Universitas: Institut Teknologi PLN
- Avatar dengan inisial otomatis
- Edit profil dengan validasi
- Riwayat transaksi lengkap

**Use Case:**

- User baru melakukan registrasi dengan data lengkap
- User login menggunakan email dan password
- Nama user otomatis tampil di seluruh aplikasi
- Logout menghapus session dan kembali ke halaman login

---

### 🏠 2. Halaman Beranda (Home)

**Dashboard Interaktif & Personal**

**Header dengan Sapaan Personal:**

- Avatar dengan inisial user (A, B, C...)
- Greeting: "Halo, [Nama Depan]!" (dinamis sesuai user login)
- Notifikasi bell icon dengan badge

**Hero Card - Statistik User:**

- Total poin terkini dengan desain menarik
- Progress bar target bulanan (kg sampah)
- Persentase pencapaian (contoh: 68% dari 15kg)
- Level/badge user (Pemula, Aktif, Juara, dll)

**Action Squares - Quick Access:**

- 🗑️ **Setor Sampah**: Langsung ke halaman setor
- 🎁 **Tukar Poin**: Akses katalog reward
- Design card dengan gradient hijau yang eye-catching

**Tips Edukasi Carousel:**

- Banner scroll horizontal dengan tips daur ulang
- Artikel pendek tentang manfaat lingkungan
- Auto-scroll dengan indicator dots

**Aktivitas Terkini:**

- 4 transaksi terakhir (setor sampah & tukar reward)
- Icon berbeda untuk setor (+) dan tukar (-)
- Detail: nama item, berat/jumlah, poin, timestamp
- Button "Lihat Semua" ke halaman History

**Use Case:**

- User login → Langsung lihat saldo poin dan progres
- Quick access ke fitur utama tanpa navigasi kompleks
- Monitoring aktivitas real-time

---

### ♻️ 3. Setor Sampah (Deposit Waste)

**Sistem Setoran Fleksibel dengan Kalkulasi Otomatis**

Fitur untuk menyetorkan sampah daur ulang:

- **Input Jenis Sampah**: Pilih dari 4 kategori (Plastik, Kertas, Logam, Kaca)
- **Input Berat**: Masukkan berat sampah dalam kg
- **Kalkulasi Otomatis**: Sistem menghitung poin berdasarkan rate per kg
- **Rate Per Jenis**:
  - Plastik: 100 poin/kg
  - Kertas: 50 poin/kg
  - Logam: 120 poin/kg
  - Kaca: 90 poin/kg
- **Validasi**:
  - Minimum berat > 0 kg
  - Maximum berat 1000 kg per transaksi
- **Update Real-time**: Total kg dan poin pengguna langsung diperbarui

**Use Case:**

- Pengguna memilih jenis sampah
- Pengguna memasukkan berat sampah
- Sistem memvalidasi input
- Sistem menghitung poin dan menambahkan ke akun pengguna
- Riwayat transaksi dicatat

### 🎁 4. Tukar Poin (Reward Catalog)

**Katalog Reward Menarik dengan Gambar Produk Asli**

**Tampilan Hero Card:**

- Icon piala besar
- Total poin user saat ini
- Gradient hijau menarik

**Grid Katalog (2 Kolom):**
Menampilkan 6 produk reward dengan gambar asli:

1. **Voucher Kopi Kampus** - 450 poin

   - Gambar: Cup kopi kampus
   - Deskripsi: Satu cup kopi dari kedai kampus

2. **Tumbler Eksklusif** - 520 poin

   - Gambar: Tumbler stainless premium
   - Deskripsi: Tumbler stainless untuk air minum

3. **ToteBag RePoints** - 380 poin

   - Gambar: Tas belanja kanvas
   - Deskripsi: Tas belanja ramah lingkungan

4. **Voucher Minimarket Gorong** - 600 poin

   - Gambar: Gift card minimarket
   - Deskripsi: Voucher belanja Rp 50.000

5. **Voucher Print Gorong** - 300 poin

   - Gambar: Printer dan dokumen
   - Deskripsi: Gratis print 100 lembar

6. **Kaos RePoints** - 750 poin
   - Gambar: T-shirt hijau branded
   - Deskripsi: Kaos eksklusif RePoints

**Fitur Kartu Produk:**

- Gambar produk HD dari `asset/Katalog_reward/`
- Badge poin dengan warna berbeda
- Icon kategori (coffee, water_drop, shopping_bag, store, print, checkroom)
- Status "Poin Cukup" atau "Poin Kurang"

**Halaman Detail & Konfirmasi:**

- Gambar produk besar (200x200)
- Nama dan deskripsi lengkap
- Total poin yang dibutuhkan
- Saldo poin user saat ini
- Button "Tukar Sekarang" (disabled jika poin kurang)
- Konfirmasi dialog sebelum redeem

**Success Page:**

- Animasi success dengan gambar berhasil
- Detail reward yang ditukar
- Instruksi pengambilan:
  - "Tunjukkan halaman ini ke petugas"
  - Kode redeem unik
  - Lokasi pengambilan
  - Waktu berlaku
- Button "Kembali ke Katalog"

**Use Case:**

- User browse katalog → Pilih reward → Cek poin cukup → Konfirmasi → Success + instruksi pengambilan

---

### 📚 5. Edukasi Lingkungan

**Platform Pembelajaran tentang Daur Ulang & Lingkungan**

**Tab Navigation (3 Kategori Utama):**

- 📖 Artikel
- 🎬 Video Tutorial
- 💡 Tips & Trik

**Search Bar:**

- Pencarian real-time berdasarkan judul dan keyword
- Icon search dengan placeholder

**Filter Chips:**

- 🔖 Favorit Only
- ♻️ Daur Ulang
- 🌍 Lingkungan
- 💡 Tips & Trik
- 🚀 Inovasi
- 👥 Komunitas

**Card Artikel (List View):**

- Thumbnail gambar artikel
- Icon kategori dengan warna berbeda
- Judul artikel (bold)
- Deskripsi singkat (2-3 baris)
- Metadata:
  - 📅 Tanggal publish
  - ⏱️ Waktu baca (5 min, 10 min)
  - 🏷️ Tags/label
- Status indicator:
  - ✓ Sudah dibaca (badge hijau)
  - ❤️ Favorit (icon merah)

**Detail Artikel:**

- Cover image full width
- Judul besar dan jelas
- Author & tanggal
- Konten lengkap dengan formatting
- Related articles di bawah
- Button favorit & share

**Tracking & Engagement:**

- Auto-mark "sudah dibaca" saat scroll ke bawah
- Counter total artikel dibaca
- Bookmark untuk baca nanti
- Riwayat artikel yang pernah dibuka

**Use Case:**

- User browse artikel → Filter kategori → Klik artikel → Baca lengkap → Auto mark "sudah dibaca" → Bookmark favorit

---

### 📜 6. Riwayat Transaksi (History)

**Timeline Lengkap Semua Aktivitas User**

**List View Chronological:**
Urut dari transaksi terbaru ke terlama

**Tipe Transaksi:**

1. **Setor Sampah (+Poin) - Icon Hijau**

   - Judul: "Setor [Jenis Sampah]"
   - Detail: "[Berat] kg • [Poin] poin"
   - Timestamp: "Hari ini, 08:40" / "Kemarin, 17:05" / "3 Hari lalu"
   - Warna hijau: #4CAF50

2. **Tukar Reward (-Poin) - Icon Oranye**
   - Judul: "Tukar [Nama Reward]"
   - Detail: "[Nama Item]"
   - Timestamp dengan format sama
   - Warna oranye: #FF9800

**Informasi Setiap Entry:**

- Icon circle dengan tipe (+ atau -)
- Judul transaksi (bold)
- Detail spesifik
- Timestamp relatif (hari ini, kemarin, X hari lalu)
- Delta poin dengan tanda + atau -

**Filter & Sort (Future):**

- Filter by type (setor only / tukar only / semua)
- Filter by date range
- Search transaksi

**Bottom Padding:**

- Extra space 70px untuk menghindari tertutup bottom navigation

**Use Case:**

- User buka History → Lihat semua transaksi → Analisa pola aktivitas → Track total kontribusi

---

### 👤 7. Profile Pengguna

**Manajemen Data Personal & Statistik**

Manajemen data dan informasi pengguna:

- **Informasi Personal**:
  - Nama lengkap
  - Email
  - Nomor telepon
  - Foto profil (atau inisial jika belum upload)
- **Informasi Akademik**:
  - Universitas
  - Fakultas
  - Jurusan/Program Studi
  - NIM (Nomor Induk Mahasiswa)
  - Tanggal bergabung
- **Statistik**:
  - Total poin yang dimiliki
  - Total kg sampah yang disetor
  - Level/badge pengguna
- **Edit Profile**: Pengguna dapat mengubah semua informasi kecuali NIM dan tanggal bergabung
- **Action Buttons**:
  - Edit profil
  - Pengaturan aplikasi (future)
  - Logout (future)

**Use Case:**

- Pengguna membuka halaman profil
- Pengguna melihat informasi dan statistik mereka
- Pengguna klik tombol edit
- Pengguna mengubah informasi yang diinginkan
- Sistem memvalidasi dan menyimpan perubahan

---

## Arsitektur Aplikasi

### Struktur Folder

```
lib/
├── main.dart                      # Entry point aplikasi
├── app/
│   ├── repoint_app.dart          # Konfigurasi MaterialApp, theme, routing
│   └── repoint_shell.dart        # Shell dengan BottomNavigationBar, state management
├── features/                      # Fitur aplikasi (feature-first architecture)
│   ├── auth/                      # ⭐ Autentikasi
│   │   ├── login_page.dart       # Halaman login
│   │   └── registration_page.dart # Halaman registrasi
│   ├── home/
│   │   └── home_page.dart        # Halaman beranda
│   ├── setor/
│   │   └── setor_sampah_page.dart  # Form setor sampah
│   ├── reward/
│   │   ├── reward_page.dart      # Katalog reward
│   │   ├── reward_redeem_page.dart  # Konfirmasi penukaran
│   │   └── reward_success_page.dart # Success screen
│   ├── education/
│   │   ├── education_page.dart   # List artikel edukasi
│   │   └── education_detail_page.dart # Detail artikel
│   ├── history/
│   │   └── history_page.dart     # Riwayat transaksi
│   └── profile/
│       ├── profile_page.dart     # Tampilan profil
│       └── edit_profile_page.dart # Edit profil
├── models/                        # Data models
│   ├── user_profile.dart         # Model profil pengguna
│   ├── history_entry.dart        # Model entri riwayat
│   ├── reward_item.dart          # Model item reward
│   └── edukasi_item.dart         # Model artikel edukasi
├── widgets/                       # Reusable widgets
│   ├── action_square.dart        # Button aksi di home
│   └── history_tile.dart         # Widget tile riwayat
└── utils/                         # Utility & constants
    ├── app_constants.dart        # Konstanta aplikasi
    └── format_utils.dart         # Helper formatting
```

### Design Pattern

1. **Feature-First Architecture**: Organisasi kode berdasarkan fitur/modul
2. **Stateful Widget Pattern**: Menggunakan StatefulWidget untuk state management lokal
3. **Data Model Pattern**: Pemisahan data model dari UI
4. **Reusable Component**: Widget yang dapat digunakan kembali

### State Management

Saat ini menggunakan **StatefulWidget** dengan local state di `RePointShell`:

- `_userProfile`: Data profil pengguna
- `_userPoints`: Total poin pengguna
- `_monthlyKg`: Total kg sampah bulan ini
- `_history`: List riwayat transaksi
- `_rewardCatalog`: Katalog reward
- `_edukasiItems`: List artikel edukasi
- `_selectedIndex`: Index halaman yang aktif di bottom nav

**Catatan**: Untuk pengembangan lebih lanjut, disarankan migrasi ke state management yang lebih robust seperti Provider, Riverpod, atau Bloc.

### Navigasi

- **Bottom Navigation Bar**: 5 tab utama (Home, Riwayat, Setor, Edukasi, Profil)
- **Route Navigation**: Menggunakan `Navigator.push()` untuk halaman sekunder
- **Modal Result**: Beberapa halaman return hasil (misal: SetorSampahPage return SetoranInput)

---

## Model Data

### 1. UserProfile

```dart
class UserProfile {
  String id;              // Unique identifier
  String name;            // Nama lengkap
  String email;           // Email mahasiswa
  String phone;           // Nomor telepon
  String university;      // Nama universitas
  String faculty;         // Fakultas
  String major;           // Jurusan
  String nim;             // NIM
  String profileImage;    // URL/path foto profil
  DateTime joinDate;      // Tanggal bergabung
}
```

### 2. HistoryEntry

```dart
class HistoryEntry {
  String title;           // Judul transaksi
  String detail;          // Detail (berat, item reward)
  String dateLabel;       // Label waktu
  int pointsDelta;        // Perubahan poin (+/-)
  bool isGain;            // true = dapat poin, false = tukar reward
}
```

### 3. RewardItem

```dart
class RewardItem {
  String title;           // Nama reward
  int cost;               // Harga dalam poin
  String description;     // Deskripsi reward
  IconData icon;          // Icon
  Color accent;           // Warna aksen
}
```

### 4. EdukasiItem

```dart
class EdukasiItem {
  String id;              // Unique identifier
  String title;           // Judul artikel
  String description;     // Deskripsi singkat
  String fullContent;     // Konten lengkap
  IconData icon;          // Icon kategori
  String imagePath;       // Path gambar artikel
  EdukasiCategory category; // Kategori artikel
  int readMinutes;        // Estimasi waktu baca
  DateTime publishDate;   // Tanggal publikasi
  List<String> tags;      // Tag artikel
  bool isFavorite;        // Status favorit
  bool isRead;            // Status sudah dibaca
}
```

### 5. SetoranInput

```dart
class SetoranInput {
  String jenis;           // Jenis sampah (Plastik/Kertas/Logam/Kaca)
  double berat;           // Berat dalam kg
}
```

---

## Business Logic & Rules

### Kalkulasi Poin Setor Sampah

```
poin = berat (kg) × rate_per_kg

Rate per jenis:
- Plastik: 100 poin/kg
- Kertas: 50 poin/kg
- Logam: 120 poin/kg
- Kaca: 90 poin/kg
```

### Validasi Setor Sampah

- Berat harus > 0 kg
- Berat maksimal 1000 kg per transaksi
- Input harus berupa angka valid

### Sistem Level/Badge

Berdasarkan total kg sampah:

- **Pemula**: 0-10 kg
- **Aktif**: 10-30 kg
- **Konsisten**: 30-50 kg
- **Champion**: > 50 kg

### Target Bulanan

- Target default: 15 kg/bulan
- Progress bar dihitung: (monthlyKg / targetKg) × 100%
- Reset otomatis setiap awal bulan (future implementation)

### Validasi Penukaran Reward

```
if (userPoints >= rewardCost) {
  // Allow redemption
  userPoints -= rewardCost;
  // Add to history
} else {
  // Show error: poin tidak cukup
}
```

---

## User Flow Diagrams

### Flow 1: Setor Sampah

```
[Home Page]
    ↓ (Tap Setor Sampah)
[Setor Sampah Page]
    ↓ (Pilih Jenis Sampah)
[Input Berat]
    ↓ (Submit)
[Validasi]
    ↓ (Valid)
[Kalkulasi Poin]
    ↓
[Update User Points & History]
    ↓
[Kembali ke Home] (Tampilkan poin baru)
```

### Flow 2: Tukar Reward

```
[Home/Reward Page]
    ↓ (Pilih Reward)
[Reward Redeem Page]
    ↓ (Konfirmasi)
[Validasi Poin]
    ↓ (Cukup)
[Kurangi Poin]
    ↓
[Update History]
    ↓
[Reward Success Page]
    ↓ (Kembali)
[Home/Reward Page]
```

### Flow 3: Baca Artikel Edukasi

```
[Edukasi Page]
    ↓ (Pilih/Search Artikel)
[Education Detail Page]
    ↓ (Baca Artikel)
[Mark as Read]
    ↓ (Optional: Favorite)
[Update Status]
    ↓ (Kembali)
[Edukasi Page] (Update badge/status)
```

### Flow 4: Edit Profile

```
[Profile Page]
    ↓ (Tap Edit Profile)
[Edit Profile Page]
    ↓ (Ubah Data)
[Input Changes]
    ↓ (Simpan)
[Validasi]
    ↓ (Valid)
[Update User Profile]
    ↓
[Kembali ke Profile Page] (Tampilkan data baru)
```

### Flow 5: Registrasi (Sign Up)

```
[App Start / Registration Page]
    ↓ (User Fills Form)
[Input: Nama, Email, Jurusan, Password, Konfirmasi Password, No. Telp]
    ↓ (Submit)
[Validasi Input]
    ↓ (Valid)
[Create Account]
    ↓
[Success Message]
    ↓
[Redirect to Login Page]
```

### Flow 6: Login (Sign In)

```
[Login Page]
    ↓ (Input Email & Password)
[Submit Login]
    ↓
[Validasi Credentials]
    ↓ (Valid)
[Create Session]
    ↓
[Navigate to Home Page]
    ↓
[User Logged In - Access All Features]

Alternative Flow (Lupa Password):
[Login Page]
    ↓ (Tap "Lupa Kata Sandi?")
[Show Dialog]
    ↓
[Instruksi Kontak Admin]
```

---

## Diagram UML yang Dapat Dibuat

Berdasarkan dokumentasi ini, tim dapat membuat:

### 1. **Use Case Diagram**

Aktor:

- Mahasiswa (User)
- Sistem

Use Cases:

- Register Account (Daftar Akun)
- Login (Masuk)
- Forgot Password (Lupa Kata Sandi)
- View Dashboard
- Setor Sampah
- Lihat Katalog Reward
- Tukar Reward
- Lihat Riwayat
- Baca Artikel Edukasi
- Edit Profil
- View Statistik

### 2. **Activity Diagram**

- Activity: Setor Sampah (dari pilih jenis sampai poin masuk)
- Activity: Tukar Reward (dari pilih reward sampai success)
- Activity: Edit Profil (dari klik edit sampai save)

### 3. **Sequence Diagram**

- Sequence: Proses Setor Sampah
  - User → SetorPage → Validasi → Calculate → Update State → Home
- Sequence: Proses Tukar Reward
  - User → RewardPage → RedeemPage → Validasi → Update State → SuccessPage

### 4. **Class Diagram**

Classes:

- UserProfile
- HistoryEntry
- RewardItem
- EdukasiItem
- SetoranInput
- RePointShell (main state)
- HomePage, SetorPage, RewardPage, dll.

Relationships:

- RePointShell has-a UserProfile
- RePointShell has-many HistoryEntry
- RePointShell has-many RewardItem
- RePointShell has-many EdukasiItem

### 5. **State Diagram**

States untuk UserProfile:

- New User
- Active User
- Inactive User

States untuk HistoryEntry:

- Pending
- Success
- Failed

### 6. **Component Diagram**

Components:

- UI Layer (Pages & Widgets)
- Business Logic Layer (State Management)
- Data Layer (Models)
- Navigation Layer

---

## Teknologi yang Digunakan

### Framework & Language

- **Flutter SDK**: ^3.9.2
- **Dart**: ^3.9.2

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8 # iOS style icons
  google_fonts: ^6.0.0 # Custom fonts (Poppins)
  flutter_svg: ^2.0.10+1 # SVG support

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0 # Linting rules
```

### Design System

- **Font**: Poppins (via Google Fonts)
- **Primary Color**: #4CAF50 (Green)
- **Secondary Color**: #E8F5E9 (Light Green)
- **Color Scheme**: Material Design dengan seed color hijau

---

## Instalasi & Setup

### Prerequisites

- Flutter SDK versi 3.9.2 atau lebih baru
- Dart SDK versi 3.9.2 atau lebih baru
- Android Studio / VS Code dengan Flutter plugin
- Android SDK (untuk development Android)
- Xcode (untuk development iOS - Mac only)

### Langkah Instalasi

1. **Clone Repository**

   ```bash
   git clone <repository-url>
   cd repoint1
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Cek Flutter Setup**

   ```bash
   flutter doctor
   ```

4. **Run Aplikasi**

   **Opsi 1: Langsung ke Halaman Home (tanpa login)** - Default

   ```bash
   # Menggunakan main.dart (langsung ke app)
   flutter run

   # Atau specify file
   flutter run lib/main.dart
   ```

   **Opsi 2: Dengan Halaman Login & Registrasi** - Untuk testing autentikasi

   ```bash
   # Menggunakan main_with_auth.dart
   flutter run lib/main_with_auth.dart

   # Atau bisa diatur sebagai default dengan:
   # 1. Rename main.dart menjadi main_no_auth.dart
   # 2. Rename main_with_auth.dart menjadi main.dart
   # 3. flutter run
   ```

   **Platform Specific:**

   ```bash
   # Android
   flutter run -d android

   # iOS (Mac only)
   flutter run -d ios

   # Web
   flutter run -d chrome
   ```

### Build untuk Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

---

## Pengembangan Selanjutnya (Future Implementation)

### Phase 1: Backend Integration

- [x] ✅ **Autentikasi UI (login/register)** - COMPLETED
  - Halaman Login dengan validasi
  - Halaman Registrasi dengan form lengkap
  - Toggle password visibility
  - Navigasi antar halaman auth
  - Lihat [AUTH_GUIDE.md](AUTH_GUIDE.md) untuk detail
- [ ] Integrasi dengan REST API / Firebase
- [ ] JWT token management dan secure storage
- [ ] Sinkronisasi data real-time
- [ ] Upload foto profil
- [ ] Notifikasi push

### Phase 2: Advanced Features

- [ ] QR Code scanning untuk verifikasi setoran
- [ ] Gamifikasi lebih lanjut (badges, leaderboard)
- [ ] Social features (share achievement, community)
- [ ] Lokasi drop point terdekat (maps integration)
- [ ] Reminder/schedule untuk setor sampah

### Phase 3: Analytics & Optimization

- [ ] Dashboard analytics untuk admin
- [ ] Laporan impact lingkungan (CO2 reduction, etc)
- [ ] Rekomendasi personal
- [ ] A/B testing untuk UI/UX improvement

### State Management Migration

Disarankan migrasi dari StatefulWidget ke:

- **Provider** (recommended untuk medium complexity)
- **Riverpod** (modern, type-safe)
- **Bloc** (untuk aplikasi besar dengan complex state)

---

## Kontak & Tim

**Developer**: [Nama Tim/Developer]
**Email**: [Email Kontak]
**Repository**: [Link Git Repository]

---

## Lisensi

[Tentukan lisensi aplikasi, misal: MIT, Apache 2.0, atau Proprietary]

---

## Catatan Tambahan

### Testing

- Saat ini belum ada unit test atau integration test
- Disarankan menambahkan test coverage minimal 70%
- Test file template ada di `test/widget_test.dart`

### Performance

- Aplikasi di-optimize untuk Android dan iOS
- Target minimum: Android 5.0 (API 21) dan iOS 11
- Performa UI dijaga dengan menggunakan `const` widget where possible

### Accessibility

- Support untuk dark mode (future)
- Support untuk berbagai ukuran font
- Color contrast sesuai WCAG guidelines

---

**Dokumentasi ini dibuat untuk memudahkan pembuatan diagram UML dan pemahaman alur aplikasi RePoint. Update dokumentasi secara berkala seiring perkembangan fitur.**
