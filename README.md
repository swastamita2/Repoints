# RePoints - Waste Management Point-Based System

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive waste management application with gamification system designed for Institut Teknologi PLN academic community.

---

## Overview

RePoints is a cross-platform mobile application that incentivizes waste recycling through a point-based reward system. Built with Flutter 3.9.2, the application combines modern UI/UX principles with gamification mechanics to encourage sustainable waste management practices within campus environments.

### Core Value Proposition

The application addresses waste management challenges in academic institutions by implementing a circular economy model where users can:

1. Deposit recyclable waste (plastic, paper, metal, glass)
2. Earn points based on waste type and weight
3. Redeem points for rewards (vouchers, merchandise, campus benefits)
4. Track environmental impact through real-time statistics
5. Access educational content about recycling and sustainability

### Target Users

**Institut Teknologi PLN Academic Community:**

- **Students**: Primary users with NIM-based identification
- **Faculty**: Teaching staff with NIP-based identification
- **Staff**: Administrative personnel with NIP-based identification

**Supported Faculties:**

- Electrical Engineering
- Mechanical Engineering
- Civil Engineering and Planning
- Economics and Business
- Electrical Power and Renewable Energy

---

## Features

### ADMIN PANEL

Administrative interface for system management and monitoring.

**Authentication:**

- Email: `admin@admin.itpln.ac.id`
- Password: `admin123`
- Domain-based automatic role detection

**Modules:**

#### 1. Dashboard

**Header Section:**

- Welcome card with admin greeting
- Prominent export button for quick access
- Direct access to export dialog without scrolling

**Real-time Statistics:**

- Total registered users with role breakdown (Students, Faculty, Staff)
- Total waste collected (kg)
- Total points distributed
- Daily transaction count

**Data Visualization:**

- User distribution by role
- Waste collection by type (Plastic, Paper, Metal, Glass)
- Progress bars with percentage indicators

**Export Functionality:**

- Transaction Report (CSV format)
- User Report (CSV format)
- Waste Collection Report by Type (CSV format)
- UTF-8 encoding with BOM for Excel compatibility
- Browser-based auto-download
- Dialog interface with three report type options

#### 2. User Management

**User Directory:**

- Complete list of registered users
- Display columns: Avatar, Name, Email, Role, Department
- User count badge

**Search and Filter:**

- Name-based search
- Role filter (All, Students, Faculty, Staff)

**User Details:**

- Complete profile information
- Registration date
- Contact details

#### 3. Transaction Management

**Transaction Log:**

- Complete deposit and redemption records
- Chronological sorting (newest first)

**Transaction Details:**

- User name with avatar
- Transaction type (Deposit/Redemption)
- Item details (waste type or reward name)
- Point delta with sign indicator
- Timestamp

**Filtering:**

- All transactions
- Deposits only
- Redemptions only

#### 4. Reward Catalog Management

**Catalog Display:**

- Grid layout with product images
- Stock counter
- Active/inactive status toggle

**CRUD Operations:**

- Create new reward
- Edit existing reward
- Delete reward
- Toggle active status

**Reward Properties:**

- Title
- Description
- Point cost
- Stock quantity
- Icon selection
- Image path
- Active status

**Stock Management:**

- Automatic stock reduction on redemption
- Stock warning indicators
- Prevention of redemption when out of stock

#### 5. Educational Content Management

**Search Functionality:**

- Real-time search (title, description, tags)
- Clear button
- Dynamic counter display (X of Y articles)
- Combined with category filtering

**Content Listing:**

- All educational articles
- Display: Icon, Title, Description, Category, Reading time
- Article count badge

**Category Filtering:**

- All categories
- Recycling
- Environment
- Tips and Tricks
- Innovation
- Community

**CRUD Operations:**

- Create new article
- Edit existing article
- Delete article

**Article Properties:**

- Title
- Short description
- Full content (multiline support)
- Category (enum dropdown)
- Estimated reading time

**Display Features:**

- Card view with category-based color coding
- Category-specific icons
- Reading time indicator
- Context menu for edit/delete operations

**Administrative Features:**

- Secure password-protected login
- Responsive design (mobile and desktop)
- Real-time statistics calculation
- In-memory state management (AppState singleton)
- Logout confirmation
- Integrated 5-tab bottom navigation

**Demo Data:**

- 8 registered users (5 Students, 2 Faculty, 1 Staff)
- 10 sample transactions
- 6 reward items with images
- 6 educational articles across all categories
- 5 notifications

---

### USER FEATURES

#### 1. Authentication and Profile

**Login and Registration:**

- Institutional email-based authentication
- Comprehensive registration form (NIM, Department, Faculty)
- Automatic user name display across application
- Secure session management
- Logout confirmation

**Profile Management:**

- Complete personal data (Name, Email, Phone, Department)
- Institution: Institut Teknologi PLN
- Auto-generated avatar from initials
- Profile editing with validation
- Transaction history access

**User Flow:**

- New user registration with complete data entry
- Email and password-based login
- Automatic name display throughout application
- Session termination on logout with redirect to login

#### 2. Home Dashboard

**Interactive Dashboard:**

**Header Section:**

- User avatar with initials
- Personalized greeting with first name
- Notification bell with badge counter

**Statistics Card:**

- Current point balance with attractive design
- Monthly target progress bar (kg waste)
- Achievement percentage display (example: 68% of 15kg)
- User level indicator (Eco Rookie, Green Warrior, Planet Guardian, Champion)

**Quick Access:**

- Deposit Waste: Direct access to deposit page
- Redeem Points: Access to reward catalog
- Gradient-styled action cards

**Educational Carousel:**

- Horizontal scrolling banner with recycling tips
- Short articles about environmental benefits
- Auto-scroll with dot indicators

**Recent Activity:**

- Last 4 transactions (deposits and redemptions)
- Distinct icons for deposits and redemptions
- Details: item name, weight/quantity, points, timestamp
- "View All" button redirecting to History page

**User Flow:**

- Login redirects to home with immediate point balance display
- Quick access to core features without complex navigation
- Real-time activity monitoring

#### 3. Waste Deposit

**Flexible Deposit System with Automatic Calculation:**

**Input Fields:**

- Waste type selection (4 categories: Plastic, Paper, Metal, Glass)
- Weight input in kilograms
- Automatic point calculation based on rate per kg

**Rate Structure:**

- Plastic: 100 points/kg
- Paper: 50 points/kg
- Metal: 120 points/kg
- Glass: 90 points/kg

**Validation:**

- Minimum weight: greater than 0 kg
- Maximum weight: 1000 kg per transaction
- Numeric input validation

**Real-time Updates:**

- Immediate update of total kg and user points

**User Flow:**

- Select waste type
- Enter weight
- System validates input
- System calculates points and adds to user account
- Transaction recorded in history

#### 4. Reward Catalog

**Comprehensive Reward Catalog with Product Images:**

**Hero Card Display:**

- Trophy icon
- Current user point balance
- Attractive gradient design

**Product Grid (2 Columns):**
Six reward products with original images:

1. **Campus Coffee Voucher** (450 points)

   - Description: One cup of coffee from campus cafe

2. **Exclusive Tumbler** (520 points)

   - Description: Stainless steel tumbler for drinking water

3. **RePoints ToteBag** (380 points)

   - Description: Eco-friendly shopping bag

4. **Gorong Minimarket Voucher** (600 points)

   - Description: Rp 50,000 shopping voucher

5. **Gorong Print Voucher** (300 points)

   - Description: Free 100-page printing

6. **RePoints T-Shirt** (750 points)
   - Description: Exclusive branded t-shirt

**Product Card Features:**

- HD product images from `asset/Katalog_reward/`
- Point badge with color variation
- Category icons
- Status indicators (Sufficient/Insufficient Points)

**Detail and Confirmation:**

- Large product image (200x200)
- Complete name and description
- Required points
- Current user point balance
- "Redeem Now" button (disabled if insufficient points)
- Confirmation dialog before redemption

**Success Page:**

- Success animation with confirmation image
- Redeemed reward details
- Collection instructions with redemption code, location, and validity period
- "Back to Catalog" button

#### 5. Environmental Education

**Learning Platform for Recycling and Environment:**

**Tab Navigation:**

- Articles
- Video Tutorials
- Tips and Tricks

**Search Functionality:**

- Real-time search by title and keywords
- Search icon with placeholder text

**Filter Options:**

- Favorites Only
- Recycling
- Environment
- Tips and Tricks
- Innovation
- Community

**Article Cards:**

- Thumbnail image
- Category-specific icon with color coding
- Bold article title
- Short description (2-3 lines)
- Metadata: publish date, reading time, tags
- Status indicators: read status, favorite status

**Article Details:**

- Full-width cover image
- Large, clear title
- Author and date
- Complete content with formatting
- Related articles section
- Favorite and share buttons

**Tracking and Engagement:**

- Auto-mark as read on scroll completion
- Total articles read counter
- Bookmark for later reading
- Article history tracking

#### 6. Transaction History

**Complete Activity Timeline:**

**Chronological List View:**
Sorted from newest to oldest transactions

**Transaction Types:**

1. **Waste Deposit (Positive Points)**

   - Title: "Deposit [Waste Type]"
   - Detail: "[Weight] kg [Points] points"
   - Timestamp: "Today, 08:40" / "Yesterday, 17:05" / "3 Days ago"
   - Color: Green #4CAF50

2. **Reward Redemption (Negative Points)**
   - Title: "Redeem [Reward Name]"
   - Detail: "[Item Name]"
   - Timestamp with same format
   - Color: Orange #FF9800

**Entry Information:**

- Circle icon with transaction type
- Bold transaction title
- Specific details
- Relative timestamp
- Point delta with sign

**Filtering and Sorting (Future):**

- Filter by type (deposits only / redemptions only / all)
- Filter by date range
- Transaction search

**Layout:**

- Bottom padding (70px) to prevent overlap with navigation

#### 7. User Profile

**Personal Data and Statistics Management:**

**Personal Information:**

- Full name
- Email address
- Phone number
- Profile photo or initial-based avatar

**Academic Information:**

- University: Institut Teknologi PLN
- Faculty
- Department/Study Program
- NIM (Student ID)
- Registration date

**Statistics:**

- Total points balance
- Total waste deposited (kg)
- User level/badge

**Profile Editing:**

- Editable fields: all except NIM and registration date
- Input validation
- Save confirmation

**Action Buttons:**

- Edit profile
- Application settings (future implementation)
- Logout (future implementation)

---

## Application Architecture

### Project Structure

```
lib/
├── main.dart                          # Application entry point
├── app/
│   ├── repoint_app.dart              # MaterialApp configuration, theme, routing
│   ├── repoint_shell.dart            # User interface shell with bottom navigation
│   ├── admin_shell.dart              # Admin interface shell with 5-tab navigation
│   └── app_state.dart                # Global state management singleton
├── features/                          # Feature-based architecture
│   ├── auth/
│   │   ├── login_page.dart           # Login page (user and admin)
│   │   └── registration_page.dart     # Registration page
│   ├── admin/
│   │   ├── admin_dashboard_page.dart  # Dashboard and statistics
│   │   ├── admin_users_page.dart      # User management
│   │   ├── admin_transactions_page.dart # Transaction history
│   │   ├── admin_rewards_page.dart    # Reward CRUD operations
│   │   └── admin_education_page.dart  # Educational content CRUD
│   ├── home/
│   │   └── home_page.dart            # Home dashboard
│   ├── setor/
│   │   └── setor_sampah_page.dart    # Waste deposit form
│   ├── reward/
│   │   ├── reward_page.dart          # Reward catalog
│   │   ├── reward_redeem_page.dart   # Redemption confirmation
│   │   └── reward_success_page.dart   # Success screen
│   ├── education/
│   │   ├── education_page.dart       # Article listing
│   │   └── education_detail_page.dart # Article details
│   ├── history/
│   │   └── history_page.dart         # Transaction history
│   └── profile/
│       ├── profile_page.dart         # Profile display
│       └── edit_profile_page.dart    # Profile editing
├── models/                            # Data models
│   ├── user_profile.dart             # User profile model
│   ├── history_entry.dart            # Transaction history model
│   ├── reward_item.dart              # Reward item model with stock management
│   ├── edukasi_item.dart             # Educational content model
│   ├── admin_stats.dart              # Admin statistics model
│   └── notification_item.dart         # Notification model
├── widgets/                           # Reusable components
│   ├── action_square.dart            # Home action buttons
│   └── history_tile.dart             # Transaction history tile
└── utils/                             # Utilities and constants
    ├── app_constants.dart            # Application constants
    └── format_utils.dart             # Formatting helpers
```

### Design Patterns

**Feature-First Architecture**
Code organized by feature/module for better scalability and maintainability.

**Stateful Widget Pattern**
StatefulWidget used for local state management where appropriate.

**Data Model Pattern**
Clear separation between data models and UI components.

**Reusable Components**
Widget composition pattern for code reusability.

### State Management

Application uses **AppState Singleton Pattern** for centralized state management.

#### AppState Implementation (lib/app/app_state.dart)

Singleton class extending `ChangeNotifier` for centralized state management:

**User Data:**

- `_allUsers`: Complete user registry
- `_allTransactions`: All transactions (deposits and redemptions)
- `_allNotifications`: User notifications queue

**Catalog Data:**

- `_rewards`: Reward catalog with stock management
- `_edukasiItems`: Educational content library

**CRUD Methods:**

- User operations: `registerUser()`, `getUserById()`, `updateUser()`
- Transaction operations: `addTransaction()`, `getTransactionsByUserId()`
- Reward operations: `addReward()`, `updateReward()`, `deleteReward()`, `checkAndReduceStock()`
- Education operations: `addEducation()`, `updateEducation()`, `deleteEducation()`
- Statistics: `calculateStats()` for admin dashboard

**Demo Data:**
Auto-initialized with 8 users, 10 transactions, 6 rewards, and 6 articles for demonstration purposes.

**Local State:**

- `RePointShell`: User interface state (5-tab navigation)
- `AdminShell`: Admin interface state (5-tab navigation)

**Note:** Current implementation uses in-memory storage. Production deployment requires database integration (Firebase/REST API).

### Navigation Architecture

**Bottom Navigation Bar**
Five primary tabs: Home, History, Deposit, Education, Profile

**Route Navigation**
Stack-based navigation using `Navigator.push()` for secondary pages

**Modal Result Pattern**
Selected pages return results (e.g., SetorSampahPage returns SetoranInput)

---

## Data Models

### UserProfile

```dart
class UserProfile {
  String id;              // Unique identifier (email)
  String name;            // Full name
  String email;           // Institution email
  String phone;           // Phone number
  String userRole;        // Role: Student/Faculty/Staff
  String identityNumber;  // NIM/NIP
  String university;      // IT PLN
  String department;      // Department/Unit
  DateTime joinDate;      // Registration date
}
```

### HistoryEntry

```dart
class HistoryEntry {
  String title;           // Transaction title
  String detail;          // Transaction details
  String dateLabel;       // Timestamp label
  int pointsDelta;        // Point change
  bool isGain;            // true: deposit, false: redemption
}
```

### RewardItem

```dart
class RewardItem {
  String id;              // Unique identifier
  String title;           // Reward name
  int cost;               // Point cost
  String description;     // Description
  IconData icon;          // Icon
  Color accent;           // Accent color
  String imagePath;       // Product image path
  int stock;              // Available stock quantity
  bool isActive;          // Active status
}
```

### EdukasiItem

```dart
class EdukasiItem {
  String id;              // Unique identifier
  String title;           // Article title
  String description;     // Short description
  String fullContent;     // Full article content
  IconData icon;          // Category icon
  String imagePath;       // Article image path
  EdukasiCategory category; // Category enum
  int readMinutes;        // Estimated reading time
  DateTime publishDate;   // Publication date
  List<String> tags;      // Article tags
  bool isFavorite;        // Favorite status
  bool isRead;            // Read status
}
```

### AdminStats

```dart
class AdminStats {
  int totalUsers;              // Total registered users
  int totalMahasiswa;          // Total students
  int totalDosen;              // Total faculty
  int totalStaff;              // Total staff
  double totalKgCollected;     // Total waste collected (kg)
  int totalPointsDistributed;  // Total points distributed
  int todayTransactions;       // Today's transaction count
  int totalDeposits;           // Total deposits
  int totalRedemptions;        // Total redemptions
  Map<String, int> usersByFaculty;      // Users by faculty
  List<TopContributor> topContributors; // Top 5 contributors
  Map<String, double> depositsByType;   // Waste by type
}
```

### NotificationItem

```dart
class NotificationItem {
  String id;              // Unique identifier
  String title;           // Notification title
  String subtitle;        // Notification detail
  DateTime date;          // Notification date
  NotificationType type;  // Type: deposit/redemption/system
}
```

### SetoranInput

```dart
class SetoranInput {
  String jenis;           // Waste type
  double berat;           // Weight in kg
}
```

---

## Business Logic

### Point Calculation

```
points = weight (kg) × rate_per_kg

Rate structure:
- Plastic: 100 points/kg
- Paper: 50 points/kg
- Metal: 120 points/kg
- Glass: 90 points/kg
```

### Deposit Validation Rules

- Weight must be greater than 0 kg
- Maximum weight: 1000 kg per transaction
- Input must be valid numeric value

### User Level System

Based on total accumulated points:

- **Eco Rookie**: 0 to 2,499 points
- **Green Warrior**: 2,500 to 3,999 points
- **Planet Guardian**: 4,000 to 5,999 points
- **Champion**: 6,000+ points

Level automatically updates in Dashboard and Profile achievements.

### Monthly Target

- Default target: 15 kg/month
- Progress calculation: (monthlyKg / targetKg) × 100%
- Automatic reset at month start (future implementation)

### Redemption Validation

```
if (userPoints >= rewardCost) {
  // Process redemption
  userPoints -= rewardCost;
  // Record in history
} else {
  // Display insufficient points error
}
```

---

## Technology Stack

### Framework and Language

- **Flutter SDK**: 3.9.2
- **Dart**: 3.9.2

### Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8 # iOS-style icons
  google_fonts: ^6.0.0 # Custom font support (Poppins)
  flutter_svg: ^2.0.10+1 # SVG rendering

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0 # Linting rules
```

**Note:** Admin dashboard uses `dart:html` for CSV export functionality (browser download). This library is deprecated for WASM builds but remains functional for standard web builds.

### Design System

- **Typography**: Poppins via Google Fonts
- **Primary Color**: #4CAF50 (Green)
- **Secondary Color**: #E8F5E9 (Light Green)
- **Color Scheme**: Material Design with green seed color

---

## Installation and Setup

### Prerequisites

- Flutter SDK version 3.9.2 or newer
- Dart SDK version 3.9.2 or newer
- Android Studio or VS Code with Flutter plugin
- Android SDK for Android development
- Xcode for iOS development (macOS only)

### Installation Steps

1. **Clone Repository**

   ```bash
   git clone <repository-url>
   cd repoint1
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify Flutter Setup**

   ```bash
   flutter doctor
   ```

4. **Run Application**

   **Option 1: Direct to Home (bypass login) - Default**

   ```bash
   flutter run
   # or explicitly
   flutter run lib/main.dart
   ```

   **Option 2: With Login and Registration - For authentication testing**

   ```bash
   flutter run lib/main_with_auth.dart
   ```

   **Platform-Specific:**

   ```bash
   # Android
   flutter run -d android

   # iOS (macOS only)
   flutter run -d ios

   # Web
   flutter run -d chrome
   ```

### Production Build

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

## Development Roadmap

### Phase 1: Backend Integration

**Completed:**

- Authentication UI (login/registration)
- Admin panel with complete management interface
  - Dashboard with statistics
  - User management with search/filter
  - Transaction management with filtering
  - Reward catalog CRUD operations
  - Educational content CRUD operations
  - CSV export functionality

**Pending:**

- REST API or Firebase integration
- JWT token management and secure storage
- Real-time data synchronization
- Profile photo upload
- Push notifications

### Phase 2: Advanced Features

- QR code scanning for deposit verification
- Enhanced gamification (badges, leaderboard)
- Social features (achievement sharing, community)
- Drop point location via maps integration
- Deposit reminder and scheduling

### Phase 3: Analytics and Optimization

- Admin analytics dashboard
- Environmental impact reporting (CO2 reduction, etc.)
- Personalized recommendations
- A/B testing for UI/UX improvements

### State Management Migration

Recommended migration from StatefulWidget to:

- **Provider**: Suitable for medium complexity applications
- **Riverpod**: Modern, type-safe state management
- **Bloc**: Enterprise-grade state management for complex applications

---

## License

[Specify application license: MIT, Apache 2.0, or Proprietary]

---

**Documentation maintained by development team**
**Last updated: January 2026**

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

## License

[Specify application license: MIT, Apache 2.0, or Proprietary]

---

**Documentation maintained by development team**
**Last updated: January 2026**
