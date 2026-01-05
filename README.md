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

**Seluruh Civitas Akademika Institut Teknologi PLN:**

- **Mahasiswa**: Pengguna utama yang aktif menyetor sampah (identitas: NIM)
- **Dosen**: Staff pengajar yang mendukung program lingkungan (identitas: NIP)
- **Tendik/Staff**: Tenaga kependidikan dan staff administrasi (identitas: NIP)

**Fakultas yang Didukung:**

- Fakultas Teknik Elektro
- Fakultas Teknik Mesin
- Fakultas Teknik Sipil dan Perencanaan
- Fakultas Ekonomi dan Bisnis
- Fakultas Ketenagalistrikan dan Energi Terbarukan

---

## ✨ Fitur Utama

### � ADMIN PANEL (New!)

**Sistem Manajemen untuk Administrator**

**Login Admin:**

- Email admin: `admin@admin.itpln.ac.id`
- Password: `admin123`
- Deteksi otomatis berdasarkan domain email

**5 Menu Utama:**

#### 1. 📊 Dashboard

**Header dengan Export Button:**
- Welcome card dengan greeting admin
- **Export button** (prominent, di header sebelah kanan)
- Langsung akses dialog export tanpa scroll

**Statistik Real-time:**
- Total users (breakdown: Mahasiswa, Dosen, Staff)
- Total kg sampah terkumpul
- Total poin terdistribusi
- Transaksi hari ini

**Charts & Visualisasi:**
- User breakdown by role (visual representation)
- Deposit breakdown by type (Plastik, Kertas, Logam, Kaca)
- Progress bars dengan persentase

**Export Feature:**
- Laporan Transaksi (CSV)
- Laporan Pengguna (CSV)
- Laporan Sampah per Jenis (CSV)
- UTF-8 encoding dengan BOM
- Auto-download via browser
- Dialog dengan 3 pilihan report type

#### 2. 👥 Users Management

- **User List:**
  - View all registered users
  - Display: Avatar, Nama, Email, Role, Jurusan
  - User counter badge
- **Search & Filter:**
  - Search by name
  - Filter by role (All, Mahasiswa, Dosen, Staff)
- **User Details:**
  - Full profile information
  - Join date
  - Contact details

#### 3. 📝 Transaksi Management

- **Transaction List:**
  - All deposits and redemptions
  - Chronological order (newest first)
- **Details per Transaction:**
  - User name and avatar
  - Type (Deposit/Redemption)
  - Item details (waste type or reward name)
  - Points delta (+/-)
  - Timestamp
- **Filter Options:**
  - All transactions
  - Deposits only
  - Redemptions only

#### 4. 🎁 Rewards Management

- **Catalog Display:**
  - Grid view with product images
  - Stock count visible
  - Active/inactive status toggle
- **CRUD Operations:**
  - ➕ Add new reward
  - ✏️ Edit existing reward
  - 🗑️ Delete reward
  - 🔄 Toggle active status
- **Form Fields:**
  - Title (nama reward)
  - Description
  - Cost (harga dalam poin)
  - Stock (jumlah tersedia)
  - Icon selection
  - Image path
  - Active status
- **Stock Management:**
  - Auto-reduce on redemption
  - Stock warning indicators
  - Prevent redemption when out of stock

#### 5. 📚 Edukasi Management

**Search Functionality:**
- Real-time search bar (judul, deskripsi, tags)
- Clear button when typing
- Counter update: "X dari Y artikel"
- Kombinasi dengan filter kategori

**Content List:**
- All education articles
- Display: Icon, Title, Description, Category, Read time
- Article counter badge

**Filter by Category:**
- All
- Daur Ulang
- Lingkungan
- Tips & Trik
- Inovasi
- Komunitas

**CRUD Operations:**
- ➕ Add new article
- ✏️ Edit existing article
- 🗑️ Delete article

**Form Fields:**
- Title (judul artikel)
- Description (deskripsi singkat)
- Full Content (konten lengkap, multiline)
- Category (dropdown enum)
- Read Minutes (waktu baca estimasi)

**Content Display:**
- Card view with category color coding
- Icon per category
- Read time indicator
- Three-dot menu (edit/delete)

**Admin Features:**

- 🔐 Secure login with password validation
- 🎨 Responsive design (mobile & desktop)
- 📊 Real-time statistics calculation
- 💾 In-memory state management (AppState singleton)
- 🚪 Logout with confirmation
- 🎯 Integrated bottom navigation (5 tabs)

**Dummy Data (for demo):**

- 8 registered users (5 Mahasiswa, 2 Dosen, 1 Staff)
- 10 sample transactions
- 6 reward items with images
- 6 education articles across all categories
- 5 notifications

---

### �🔐 1. Autentikasi & Profil User

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
- Level user (Eco Rookie, Green Warrior, Planet Guardian, Champion)

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
│   ├── repoint_shell.dart        # Shell dengan BottomNavigationBar (User)
│   ├── admin_shell.dart          # ⭐ Shell admin dengan 5-tab navigation
│   └── app_state.dart            # ⭐ Global state management (singleton)
├── features/                      # Fitur aplikasi (feature-first architecture)
│   ├── auth/                      # ⭐ Autentikasi
│   │   ├── login_page.dart       # Halaman login (user & admin)
│   │   └── registration_page.dart # Halaman registrasi
│   ├── admin/                     # ⭐ Admin Panel (NEW)
│   │   ├── admin_dashboard_page.dart      # Dashboard & statistics
│   │   ├── admin_users_page.dart          # User management
│   │   ├── admin_transactions_page.dart   # Transaction history
│   │   ├── admin_rewards_page.dart        # Reward CRUD
│   │   └── admin_education_page.dart      # Education content CRUD
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
│   ├── reward_item.dart          # Model item reward (+ stock, isActive)
│   ├── edukasi_item.dart         # Model artikel edukasi
│   ├── admin_stats.dart          # ⭐ Model statistik admin
│   └── notification_item.dart    # Model notifikasi
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

Aplikasi menggunakan **AppState Singleton Pattern** untuk global state management:

#### AppState (lib/app/app_state.dart)

Singleton class dengan `ChangeNotifier` untuk state management terpusat:

**User Data:**

- `_allUsers`: List semua registered users
- `_allTransactions`: List semua transaksi (deposit & redemption)
- `_allNotifications`: List notifikasi user

**Catalog Data:**

- `_rewards`: Katalog reward dengan stock management
- `_edukasiItems`: List artikel edukasi

**CRUD Methods:**

- User: `registerUser()`, `getUserById()`, `updateUser()`
- Transaction: `addTransaction()`, `getTransactionsByUserId()`
- Reward: `addReward()`, `updateReward()`, `deleteReward()`, `checkAndReduceStock()`
- Education: `addEducation()`, `updateEducation()`, `deleteEducation()`
- Statistics: `calculateStats()` (untuk admin dashboard)

**Dummy Data:**

- Auto-initialize dengan 8 users, 10 transactions, 6 rewards, 6 articles
- Untuk demo dan testing purposes

**Local State:**

- `RePointShell`: State untuk user interface (5-tab navigation)
- `AdminShell`: State untuk admin interface (5-tab navigation)

**Catatan**: Saat ini menggunakan in-memory storage. Untuk production, perlu integrasi dengan database (Firebase/REST API).

### Navigasi

- **Bottom Navigation Bar**: 5 tab utama (Home, Riwayat, Setor, Edukasi, Profil)
- **Route Navigation**: Menggunakan `Navigator.push()` untuk halaman sekunder
- **Modal Result**: Beberapa halaman return hasil (misal: SetorSampahPage return SetoranInput)

---

## Model Data

### 1. UserProfile

```dart
class UserProfile {
  String id;              // Unique identifier (email)
  String name;            // Nama lengkap
  String email;           // Email mahasiswa/dosen/staff
  String phone;           // Nomor telepon
  String userRole;        // Role: Mahasiswa/Dosen/Tendik/Staff
  String identityNumber;  // NIM/NIP
  String university;      // Nama universitas (IT PLN)
  String department;      // Jurusan/Departemen
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
  String id;              // Unique identifier
  String title;           // Nama reward
  int cost;               // Harga dalam poin
  String description;     // Deskripsi reward
  IconData icon;          // Icon
  Color accent;           // Warna aksen
  String imagePath;       // Path gambar produk
  int stock;              // Jumlah stok tersedia (NEW)
  bool isActive;          // Status aktif/nonaktif (NEW)
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
  EdukasiCategory category; // Kategori artikel (enum)
  int readMinutes;        // Estimasi waktu baca
  DateTime publishDate;   // Tanggal publikasi
  List<String> tags;      // Tag artikel
  bool isFavorite;        // Status favorit
  bool isRead;            // Status sudah dibaca
}
```

### 5. AdminStats (NEW)

```dart
class AdminStats {
  int totalUsers;              // Total pengguna terdaftar
  int totalMahasiswa;          // Total mahasiswa
  int totalDosen;              // Total dosen
  int totalStaff;              // Total staff/tendik
  double totalKgCollected;     // Total kg sampah terkumpul
  int totalPointsDistributed;  // Total poin terdistribusi
  int todayTransactions;       // Transaksi hari ini
  int totalDeposits;           // Total setoran
  int totalRedemptions;        // Total penukaran
  Map<String, int> usersByFaculty;      // User per fakultas
  List<TopContributor> topContributors; // Top 5 kontributor
  Map<String, double> depositsByType;   // Sampah per jenis
}
```

### 6. NotificationItem (NEW)

```dart
class NotificationItem {
  String id;              // Unique identifier
  String title;           // Judul notifikasi
  String subtitle;        // Subtitle/detail
  DateTime date;          // Tanggal notifikasi
  NotificationType type;  // Type: deposit/redemption/system
}
```

### 7. SetoranInput

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

Berdasarkan total poin yang dikumpulkan:

- **Eco Rookie**: 0-2,499 poin (Gold badge 🥉)
- **Green Warrior**: 2,500-3,999 poin (Green badge 💚)
- **Planet Guardian**: 4,000-5,999 poin (Blue badge 🌍)
- **Champion**: 6,000+ poin (Purple badge ⭐)

_Level otomatis update di Dashboard dan Achievement badge di Profile_

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

**Note:** Admin dashboard menggunakan `dart:html` untuk fitur export CSV (browser download). Library ini deprecated untuk WASM builds, tapi masih berfungsi normal untuk web builds standard.

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
- [x] ✅ **Admin Panel** - COMPLETED
  - Dashboard admin dengan statistik lengkap
  - Manajemen user (view, search, filter)
  - Manajemen transaksi dengan filter
  - Manajemen reward (CRUD lengkap)
  - Manajemen konten edukasi (CRUD lengkap)
  - Export laporan (CSV format)
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
