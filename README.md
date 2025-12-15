# RePoint - Aplikasi Manajemen Sampah Berbasis Poin

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue.svg)](https://dart.dev/)

## 🚀 Quick Start

```bash
# Clone repository
git clone <repository-url>
cd repoint1

# Install dependencies
flutter pub get

# Run dengan Login/Register
flutter run lib/main_with_auth.dart

# Atau run langsung ke Home (skip auth)
flutter run lib/main.dart
```

📖 **Dokumentasi Lengkap Autentikasi**: [AUTH_GUIDE.md](AUTH_GUIDE.md)

---

## Deskripsi Aplikasi

RePoint adalah aplikasi mobile berbasis Flutter yang dirancang untuk mendorong pengelolaan sampah yang berkelanjutan di lingkungan kampus. Aplikasi ini menggunakan sistem reward berbasis poin untuk memotivasi mahasiswa menyetorkan sampah daur ulang dan belajar tentang kelestarian lingkungan.

### Konsep Bisnis

Aplikasi ini menerapkan konsep **gamification** dalam pengelolaan sampah, di mana pengguna:

- Menyetorkan sampah daur ulang (plastik, kertas, logam, kaca) dan mendapatkan poin berdasarkan berat dan jenis sampah
- Mengumpulkan poin untuk ditukar dengan reward (voucher, merchandise, workshop)
- Memonitor kontribusi lingkungan mereka melalui statistik dan target bulanan
- Mendapatkan edukasi tentang daur ulang dan kelestarian lingkungan

### Target Pengguna

- **Mahasiswa**: Pengguna utama yang menyetor sampah dan menukar reward
- **Lingkungan Kampus**: Memfasilitasi pengelolaan sampah yang terorganisir
- **Komunitas Peduli Lingkungan**: Membangun kesadaran bersama

---

## Fitur Utama Aplikasi

### 0. **Autentikasi (Login & Registrasi)**

Sistem autentikasi untuk mengamankan akun pengguna:

#### **Halaman Registrasi (Daftar Akun)**

- **Logo RePoints**: Branding aplikasi di bagian atas
- **Form Pendaftaran**:
  - Nama Pengguna (contoh: Destia Rani)
  - Email Kampus (format: nama@itpln.ac.id)
  - Jurusan (dropdown dengan pilihan):
    - Teknik Informatika
    - Teknik Elektro
    - Teknik Sipil
    - Teknik Mesin
    - Teknik Lingkungan
    - Teknik Industri
    - Sistem Informasi
    - Arsitektur
  - Kata Sandi (minimal 8 karakter, dengan toggle visibility)
  - Konfirmasi Kata Sandi (harus cocok dengan kata sandi)
  - No. Telepon
- **Validasi**:
  - Semua field wajib diisi
  - Email harus valid (mengandung @)
  - Password minimal 8 karakter
  - Konfirmasi password harus sama
  - Nomor telepon minimal 10 digit
- **Button**: "Daftar Akun RePoints"
- **Link**: Navigasi ke halaman login untuk pengguna yang sudah punya akun

#### **Halaman Login (Masuk ke Akun)**

- **Logo RePoints**: Di bagian atas
- **Ilustrasi**: Gambar kampus dengan orang-orang dan tempat sampah (plastik, kertas, logam)
- **Form Login**:
  - Email Kampus
  - Kata Sandi (dengan toggle visibility)
- **Link**: "Lupa Kata Sandi?" untuk reset password
- **Button**: "Masuk (Login)"
- **Link**: Navigasi ke halaman registrasi untuk pengguna baru

**Use Case:**

**Flow Registrasi:**

1. Pengguna membuka aplikasi (belum login)
2. Pengguna mengisi form registrasi lengkap
3. Sistem memvalidasi semua input
4. Jika valid, akun dibuat dan redirect ke login
5. Pengguna login dengan kredensial baru

**Flow Login:**

1. Pengguna membuka aplikasi
2. Pengguna memasukkan email dan password
3. Sistem memvalidasi kredensial
4. Jika valid, redirect ke halaman home
5. Session pengguna tersimpan

**Flow Lupa Password:**

1. Pengguna klik "Lupa Kata Sandi?"
2. Dialog muncul dengan instruksi kontak admin
3. Admin melakukan reset password manual

### 1. **Halaman Beranda (Home)**

Halaman utama yang menampilkan:

- **Salam Pengguna**: Menampilkan nama pengguna dan avatar
- **Hero Card**:
  - Total poin yang dimiliki
  - Persentase progres target bulanan (kg sampah)
  - Level/badge pengguna
- **Action Buttons**: Akses cepat untuk setor sampah dan tukar reward
- **Tips Edukasi Carousel**: Banner edukasi tentang daur ulang
- **Aktivitas Terkini**: Riwayat transaksi terbaru (setor/tukar)

**Use Case:**

- Pengguna dapat melihat ringkasan aktivitas dan poin
- Pengguna dapat mengakses fitur utama dengan cepat
- Pengguna mendapat informasi edukasi lingkungan

### 2. **Setor Sampah (Deposit Waste)**

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

### 3. **Reward/Hadiah**

Katalog reward yang dapat ditukar dengan poin:

- **Tampilan Grid**: Menampilkan semua reward dalam bentuk kartu
- **Item Reward**:
  - Voucher Kopi (450 poin)
  - Paket Alat Tulis (320 poin)
  - Tumbler RePoint (520 poin)
  - Workshop Compost (280 poin)
  - Tote Bag Kampus (250 poin)
  - Diskon Kantin (500 poin)
- **Proses Penukaran**:
  1. Pengguna memilih reward
  2. Sistem validasi poin mencukupi
  3. Konfirmasi penukaran
  4. Poin dikurangi
  5. Tampilan success dengan instruksi pengambilan
- **Halaman Success**: Menampilkan detail reward yang ditukar dan cara pengambilan

**Use Case:**

- Pengguna menelusuri katalog reward
- Pengguna memilih reward yang diinginkan
- Sistem cek kecukupan poin
- Pengguna konfirmasi penukaran
- Sistem mengurangi poin dan mencatat transaksi
- Pengguna mendapat instruksi pengambilan reward

### 4. **Edukasi Lingkungan**

Platform pembelajaran tentang pengelolaan sampah:

- **Kategori Artikel**:
  - Daur Ulang
  - Lingkungan
  - Tips & Trik
  - Inovasi
  - Komunitas
- **Fitur Artikel**:
  - Judul dan deskripsi singkat
  - Waktu baca (estimasi menit)
  - Tanggal publikasi
  - Tag/label konten
  - Status favorit dan sudah dibaca
  - Ikon kategori dengan kode warna
- **Filter & Search**: Pencarian artikel berdasarkan kategori atau keyword
- **Detail Artikel**: Konten lengkap artikel dengan gambar pendukung
- **Tracking**: Sistem mencatat artikel yang sudah dibaca

**Use Case:**

- Pengguna membuka halaman edukasi
- Pengguna memilih kategori atau mencari artikel
- Pengguna membaca artikel lengkap
- Sistem menandai artikel sebagai "sudah dibaca"
- Pengguna dapat menambahkan artikel ke favorit

### 5. **Riwayat Transaksi (History)**

Catatan lengkap semua aktivitas pengguna:

- **Tipe Transaksi**:
  - **Gain (Hijau)**: Setoran sampah dengan detail berat dan poin yang didapat
  - **Loss (Oranye)**: Penukaran reward dengan detail item
- **Informasi Transaksi**:
  - Judul/nama transaksi
  - Detail spesifik (berat, item reward)
  - Timestamp (hari ini, kemarin, X hari lalu)
  - Delta poin (+/-)
- **Sorting**: Urut dari transaksi terbaru
- **Filter**: Dapat difilter berdasarkan tipe (gain/loss)

**Use Case:**

- Pengguna membuka halaman history
- Sistem menampilkan semua transaksi terurut
- Pengguna melihat detail setiap transaksi
- Pengguna dapat menganalisis pola aktivitas mereka

### 6. **Profile Pengguna**

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
