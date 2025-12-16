import 'package:flutter/material.dart';

import '../features/education/education_page.dart';
import '../features/history/history_page.dart';
import '../features/home/home_page.dart';
import '../features/profile/profile_page.dart';
import '../features/reward/reward_page.dart';
import '../features/reward/reward_redeem_page.dart';
import '../features/reward/reward_success_page.dart';
import '../features/setor/setor_sampah_page.dart';
import '../models/edukasi_item.dart';
import '../models/history_entry.dart';
import '../models/notification_item.dart';
import '../models/reward_item.dart';
import '../models/user_profile.dart';
import 'repoint_app.dart';

class RePointShell extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userRole;
  final String identityNumber;
  final String department;

  const RePointShell({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userRole,
    required this.identityNumber,
    required this.department,
  });

  @override
  State<RePointShell> createState() => _RePointShellState();
}

class _RePointShellState extends State<RePointShell> {
  static const Map<String, double> _ratePerKg = {
    'Plastik': 100,
    'Kertas': 50,
    'Logam': 120,
    'Kaca': 90,
  };

  // User Profile
  late UserProfile _userProfile;

  int _userPoints = 1500; // Demo: Eco Rookie tier (0-2499)
  double _monthlyKg = 10.2;
  final double _targetKg = 15.0;
  int _selectedIndex = 0;
  final List<NotificationItem> _notifications = [];

  @override
  void initState() {
    super.initState();
    // Initialize user profile with data from login/registration
    _userProfile = UserProfile(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      name: widget.userName,
      email: widget.userEmail,
      phone: widget.userPhone,
      university: 'Institut Teknologi PLN',
      userRole: widget.userRole,
      identityNumber: widget.identityNumber,
      department: widget.department,
      joinDate: DateTime.now(),
    );
  }

  List<HistoryEntry> _history = const [
    HistoryEntry(
      title: 'Setor Botol Plastik',
      detail: '2.0 kg • 200 poin',
      dateLabel: 'Hari ini, 08:40',
      pointsDelta: 200,
      isGain: true,
    ),
    HistoryEntry(
      title: 'Tukar Voucher Kopi',
      detail: 'Voucher Latte Manis',
      dateLabel: 'Kemarin, 17:05',
      pointsDelta: -450,
      isGain: false,
    ),
    HistoryEntry(
      title: 'Setor Karton',
      detail: '1.2 kg • 60 poin',
      dateLabel: '3 Hari lalu',
      pointsDelta: 60,
      isGain: true,
    ),
  ];

  final List<RewardItem> _rewardCatalog = const [
    RewardItem(
      title: 'Voucher Kopi Kampus',
      cost: 450,
      description: 'Satu cup kopi dari kedai kampus',
      icon: Icons.coffee,
      accent: Color(0xFF8BC34A),
      imagePath: 'asset/Katalog_reward/Voucher_Kopi_Kampus.png',
    ),
    RewardItem(
      title: 'Tumbler Ekslusif',
      cost: 520,
      description: 'Tumbler stainless untuk air minum',
      icon: Icons.water_drop,
      accent: Color(0xFF388E3C),
      imagePath: 'asset/Katalog_reward/Tumbler_Ekslusif.png',
    ),
    RewardItem(
      title: 'ToteBag RePoints',
      cost: 380,
      description: 'Tas belanja ramah lingkungan',
      icon: Icons.shopping_bag,
      accent: Color(0xFF4CAF50),
      imagePath: 'asset/Katalog_reward/ToteBag_RePoints.png',
    ),
    RewardItem(
      title: 'Voucher Minimarket Gorong',
      cost: 500,
      description: 'Voucher belanja minimarket',
      icon: Icons.store,
      accent: Color(0xFF66BB6A),
      imagePath: 'asset/Katalog_reward/Voucher_Minimarket_Gorong.png',
    ),
    RewardItem(
      title: 'Voucher Print Gorong',
      cost: 350,
      description: 'Voucher print dan fotokopi',
      icon: Icons.print,
      accent: Color(0xFF81C784),
      imagePath: 'asset/Katalog_reward/Voucher_Print_Gorong.png',
    ),
    RewardItem(
      title: 'Kaos RePoints',
      cost: 600,
      description: 'Kaos eksklusif RePoints',
      icon: Icons.checkroom,
      accent: Color(0xFF4CAF50),
      imagePath: 'asset/Katalog_reward/Kaos_RePoints.png',
    ),
  ];

  final List<EdukasiItem> _edukasiItems = [
    EdukasiItem(
      id: 'edu-001',
      title: 'Panduan Lengkap Daur Ulang Plastik',
      description:
          'Pelajari cara mendaur ulang plastik dengan benar untuk mengurangi polusi lingkungan.',
      fullContent: '''
Plastik adalah salah satu material yang paling banyak mencemari lingkungan kita. Namun, dengan pemahaman yang tepat, kita bisa membuat perbedaan besar!

**Jenis-Jenis Plastik yang Dapat Didaur Ulang:**

1. PET (Polyethylene Terephthalate) - Kode 1
   Biasa ditemukan pada botol minuman. Mudah didaur ulang menjadi tas, karpet, atau pakaian.

2. HDPE (High-Density Polyethylene) - Kode 2
   Digunakan untuk botol detergen dan produk pembersih. Dapat didaur ulang menjadi pipa dan botol baru.

3. PVC (Polyvinyl Chloride) - Kode 3
   Ditemukan pada pipa dan kemasan. Sulit didaur ulang dan sebaiknya dikurangi penggunaannya.

4. LDPE (Low-Density Polyethylene) - Kode 4
   Plastik kantong belanja. Dapat didaur ulang menjadi produk plastik lainnya.

5. PP (Polypropylene) - Kode 5
   Wadah makanan dan sedotan. Relatif mudah didaur ulang.

**Langkah-Langkah Mempersiapkan Plastik untuk Daur Ulang:**

1. Bersihkan sisa makanan atau minuman
2. Keringkan sebelum disimpan
3. Lepaskan label jika memungkinkan
4. Pisahkan berdasarkan jenis plastik
5. Kumpulkan dalam jumlah yang cukup
6. Bawa ke tempat pengumpulan atau gunakan aplikasi RePoints!

**Dampak Positif Daur Ulang Plastik:**

Dengan mendaur ulang 1 kg plastik, Anda dapat:
- Menghemat energi setara dengan 2 hari penggunaan listrik rumah
- Mengurangi emisi CO2 sebesar 1.5 kg
- Mencegah plastik masuk ke laut dan membahayakan kehidupan laut
- Menghasilkan poin yang dapat ditukar dengan hadiah!

Mari bersama-sama membuat bumi lebih hijau dengan mendaur ulang plastik!
      ''',
      icon: Icons.recycling,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.daurUlang,
      readMinutes: 5,
      publishDate: DateTime(2024, 12, 1),
      tags: ['plastik', 'daur-ulang', 'lingkungan', 'tips'],
    ),
    EdukasiItem(
      id: 'edu-002',
      title: 'Mengapa Lingkungan Memerlukan Perhatian Kita?',
      description:
          'Memahami pentingnya menjaga lingkungan untuk generasi masa depan.',
      fullContent: '''
Bumi adalah rumah kita satu-satunya. Namun, apakah kita sudah cukup peduli terhadap kondisinya?

**Fakta Mengejutkan Tentang Lingkungan:**

- Setiap menit, 1 truk sampah plastik dibuang ke laut
- Indonesia menghasilkan 67 juta ton sampah per tahun
- Hanya 10% sampah yang berhasil didaur ulang
- Sampah plastik membutuhkan 500-1000 tahun untuk terurai

**Dampak Kerusakan Lingkungan:**

1. **Perubahan Iklim**
   Emisi gas rumah kaca menyebabkan pemanasan global yang mengancam kehidupan.

2. **Kehilangan Keanekaragaman Hayati**
   Setiap hari, 150-200 spesies punah akibat kerusakan habitat.

3. **Polusi Air dan Udara**
   Kualitas air dan udara menurun, berdampak pada kesehatan manusia.

4. **Kerusakan Ekosistem**
   Hutan, laut, dan tanah mengalami degradasi yang parah.

**Apa yang Bisa Kita Lakukan?**

1. **Reduce (Kurangi)**
   Kurangi penggunaan barang sekali pakai dan konsumsi berlebihan.

2. **Reuse (Gunakan Kembali)**
   Gunakan kembali barang yang masih layak pakai.

3. **Recycle (Daur Ulang)**
   Pisahkan sampah dan kirim untuk didaur ulang.

4. **Replace (Ganti)**
   Ganti produk berbahaya dengan alternatif ramah lingkungan.

5. **Replant (Tanam Kembali)**
   Tanam pohon dan rawat tanaman di sekitar kita.

**Gerakan Kecil, Dampak Besar:**

Bayangkan jika 10 juta orang Indonesia mengurangi penggunaan plastik hanya 1 item per hari. Dalam setahun, kita bisa mengurangi 3.65 miliar sampah plastik!

Mulai dari diri sendiri, mulai dari sekarang. Bersama RePoints, mari wujudkan Indonesia yang lebih hijau!
      ''',
      icon: Icons.public,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.lingkungan,
      readMinutes: 7,
      publishDate: DateTime(2024, 11, 28),
      tags: ['lingkungan', 'perubahan-iklim', 'ekosistem', 'awareness'],
    ),
    EdukasiItem(
      id: 'edu-003',
      title: '10 Tips Mengurangi Sampah di Rumah',
      description:
          'Cara praktis mengurangi sampah sehari-hari yang mudah diterapkan.',
      fullContent: '''
Mengurangi sampah di rumah tidak harus sulit! Berikut adalah 10 tips praktis yang bisa langsung Anda terapkan:

**1. Gunakan Tas Belanja Sendiri**
Bawa tas kain saat berbelanja. Satu tas kain bisa menggantikan 1000 kantong plastik dalam setahun!

**2. Hindari Botol Plastik Sekali Pakai**
Gunakan tumbler atau botol minum yang bisa digunakan berulang kali.

**3. Buat Kompos dari Sampah Organik**
Sampah dapur seperti sisa sayuran bisa dijadikan kompos untuk tanaman.

**4. Belanja Sesuai Kebutuhan**
Buat daftar belanjaan agar tidak membeli berlebihan dan mengurangi food waste.

**5. Pilih Produk dengan Kemasan Minimal**
Beli produk dengan kemasan yang bisa didaur ulang atau tanpa kemasan berlebih.

**6. Gunakan Wadah Makanan Reusable**
Ganti plastik wrap dengan wadah kaca atau stainless steel.

**7. Repair, Don't Replace**
Perbaiki barang yang rusak sebelum memutuskan membeli yang baru.

**8. Donasi Barang yang Tidak Terpakai**
Pakaian, buku, atau perabotan yang masih layak bisa didonasikan.

**9. Buat DIY Cleaning Products**
Buat pembersih rumah sendiri dari bahan alami seperti cuka dan baking soda.

**10. Edukasi Keluarga**
Ajak seluruh anggota keluarga untuk peduli dan menerapkan gaya hidup zero waste.

**Tantangan 30 Hari:**

Minggu 1: Gunakan tas belanja sendiri
Minggu 2: Kurangi botol plastik
Minggu 3: Mulai kompos
Minggu 4: Evaluasi dan tingkatkan!

Dengan menerapkan tips ini, rata-rata keluarga bisa mengurangi 50-70% sampah rumah tangga. Yuk mulai sekarang!
      ''',
      icon: Icons.lightbulb,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.tips,
      readMinutes: 6,
      publishDate: DateTime(2024, 12, 5),
      tags: ['tips', 'zero-waste', 'rumah-tangga', 'praktis'],
    ),
    EdukasiItem(
      id: 'edu-004',
      title: 'Inovasi Teknologi Pengelolaan Sampah',
      description:
          'Teknologi terbaru yang mengubah sampah menjadi sumber daya berharga.',
      fullContent: '''
Teknologi terus berkembang untuk mengatasi masalah sampah. Berikut adalah inovasi-inovasi menarik di bidang pengelolaan sampah:

**1. Waste to Energy (WtE)**
Teknologi yang mengubah sampah menjadi energi listrik. Di Indonesia, sudah ada beberapa pembangkit listrik tenaga sampah yang beroperasi.

**2. Pyrolysis Plastik**
Proses termal yang mengubah plastik menjadi bahan bakar minyak. 1 ton plastik bisa menghasilkan 700 liter bahan bakar!

**3. Black Soldier Fly (BSF)**
Larva BSF dapat mengurai sampah organik 10x lebih cepat dari kompos biasa.

**4. Smart Bins**
Tempat sampah pintar yang dapat memilah sampah otomatis menggunakan AI dan sensor.

**5. Aplikasi Bank Sampah Digital**
Seperti RePoints! Memudahkan masyarakat untuk menukar sampah dengan poin dan hadiah.

**6. Biodegradable Plastic**
Plastik yang dapat terurai dalam 6 bulan, terbuat dari bahan alami seperti singkong.

**7. 3D Printing dari Plastik Daur Ulang**
Teknologi yang mengubah plastik bekas menjadi produk baru melalui 3D printing.

**8. Ocean Cleanup**
Sistem pembersih laut menggunakan teknologi arus laut untuk mengumpulkan plastik.

**Dampak Nyata:**

Di Surabaya, Waste to Energy mengolah 600 ton sampah per hari menjadi listrik untuk 50.000 rumah!

**Masa Depan Pengelolaan Sampah:**

Dengan teknologi AI dan IoT, di masa depan setiap rumah bisa memiliki sistem pengelolaan sampah otomatis yang langsung terhubung dengan fasilitas daur ulang.

Mari dukung inovasi-inovasi ini dengan terus mendaur ulang dan menggunakan teknologi seperti RePoints!
      ''',
      icon: Icons.science,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.inovasi,
      readMinutes: 8,
      publishDate: DateTime(2024, 12, 3),
      tags: ['teknologi', 'inovasi', 'wte', 'masa-depan'],
    ),
    EdukasiItem(
      id: 'edu-005',
      title: 'Bergabung dengan Komunitas Peduli Lingkungan',
      description: 'Temukan komunitas dan gerakan lingkungan di sekitar Anda.',
      fullContent: '''
Perubahan besar dimulai dari gerakan bersama! Bergabung dengan komunitas peduli lingkungan adalah cara efektif untuk membuat dampak lebih besar.

**Mengapa Bergabung dengan Komunitas?**

1. **Dukungan dan Motivasi**
   Belajar dan termotivasi dari orang-orang yang memiliki tujuan sama.

2. **Aksi Nyata**
   Ikut dalam kegiatan seperti beach cleanup, tree planting, dan workshop.

3. **Networking**
   Bertemu dengan aktivis, entrepreneur, dan changemakers.

4. **Pembelajaran Berkelanjutan**
   Akses ke workshop, seminar, dan materi edukasi terkini.

**Komunitas Lingkungan di Indonesia:**

1. **Greenpeace Indonesia**
   Organisasi global yang fokus pada kampanye lingkungan.

2. **Waste4Change**
   Perusahaan sosial yang mengelola sampah secara bertanggung jawab.

3. **Zero Waste Indonesia**
   Komunitas yang mempromosikan gaya hidup zero waste.

4. **Dietplastiksekarang**
   Gerakan untuk mengurangi penggunaan plastik sekali pakai.

5. **Bank Sampah Lokal**
   Cari bank sampah di lingkungan Anda melalui RePoints!

**Cara Memulai:**

1. **Follow Media Sosial**
   Ikuti akun komunitas untuk update kegiatan.

2. **Attend Events**
   Hadiri acara dan kegiatan untuk berkenalan.

3. **Volunteer**
   Menjadi volunteer dalam aksi atau program komunitas.

4. **Start Your Own**
   Tidak ada komunitas di area Anda? Mulai sendiri!

**Program RePoints Community:**

RePoints juga memiliki program komunitas! Anda bisa:
- Join grup WhatsApp/Telegram regional
- Ikut dalam challenge bulanan
- Dapat poin bonus untuk aksi komunitas
- Akses workshop dan webinar gratis

**Testimoni:**

"Sejak bergabung dengan komunitas, saya tidak hanya belajar tentang lingkungan, tapi juga mendapat teman seperjuangan dan inspirasi untuk terus berbuat lebih!" - Sarah, Jakarta

**Yuk Gabung Sekarang!**

Kunjungi menu Komunitas di app RePoints atau hubungi customer service untuk informasi lebih lanjut.

Bersama kita lebih kuat! Mari wujudkan Indonesia yang lebih hijau!
      ''',
      icon: Icons.groups,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.komunitas,
      readMinutes: 6,
      publishDate: DateTime(2024, 12, 8),
      tags: ['komunitas', 'networking', 'volunteer', 'gerakan'],
    ),
    EdukasiItem(
      id: 'edu-006',
      title: 'Cara Memisahkan Sampah yang Benar',
      description:
          'Panduan praktis memisahkan sampah organik, anorganik, dan B3.',
      fullContent: '''
Memisahkan sampah dengan benar adalah langkah pertama dalam pengelolaan sampah yang efektif. Berikut panduan lengkapnya:

**3 Kategori Utama Sampah:**

**1. Sampah Organik (Basah)**
Sampah yang berasal dari makhluk hidup dan dapat terurai secara alami.

Contoh:
- Sisa makanan dan minuman
- Kulit buah dan sayuran
- Daun kering dan ranting
- Tulang ikan dan ayam
- Ampas kopi dan teh

Cara Kelola: Buat kompos atau berikan ke larva BSF

**2. Sampah Anorganik (Kering)**
Sampah yang tidak dapat terurai secara alami.

a) Dapat Didaur Ulang:
   - Plastik (botol, kemasan)
   - Kertas dan kardus
   - Logam (kaleng, aluminium)
   - Kaca (botol, pecahan)
   
   Cara Kelola: Kumpulkan dan tukar di RePoints!

b) Tidak Dapat Didaur Ulang:
   - Styrofoam
   - Plastik kresek tipis
   - Kemasan multilayer
   
   Cara Kelola: Minimalkan penggunaan

**3. Sampah B3 (Bahan Berbahaya dan Beracun)**
Sampah yang mengandung bahan berbahaya.

Contoh:
- Baterai bekas
- Lampu neon
- Obat kadaluarsa
- Kaleng cat
- Elektronik rusak

Cara Kelola: Serahkan ke fasilitas khusus B3

**Sistem Warna untuk Tempat Sampah:**

🟢 Hijau: Sampah Organik
🟡 Kuning: Sampah Anorganik
🔴 Merah: Sampah B3

**Tips Praktis:**

1. Sediakan 2-3 tempat sampah di rumah
2. Bersihkan sampah anorganik sebelum disimpan
3. Keringkan sampah yang basah
4. Pisahkan tutup botol dari botolnya
5. Kumpulkan hingga jumlah cukup untuk ditukar

**Manfaat Memisahkan Sampah:**

✓ Mempermudah proses daur ulang
✓ Mengurangi volume sampah TPA
✓ Mendapat poin dari RePoints
✓ Membantu pemulung dan pengepul
✓ Menjaga kebersihan lingkungan

**Common Mistakes:**

❌ Mencampur sampah basah dan kering
❌ Tidak membersihkan kemasan
❌ Membuang baterai ke sampah biasa
❌ Menggunakan kantong plastik untuk sampah organik

Mulai sekarang, mari biasakan memisahkan sampah dengan benar!
      ''',
      icon: Icons.delete_outline,
      imagePath: 'asset/sampah.png',
      category: EdukasiCategory.tips,
      readMinutes: 5,
      publishDate: DateTime(2024, 12, 10),
      tags: ['pemilahan', 'organik', 'anorganik', 'tutorial'],
    ),
  ];

  final List<String> _navLabels = const [
    'Home',
    'Edukasi',
    'Riwayat',
    'Reward',
    'Profil',
  ];

  final List<IconData> _navIcons = const [
    Icons.home,
    Icons.menu_book,
    Icons.history,
    Icons.card_giftcard,
    Icons.person,
  ];

  String get _levelLabel {
    if (_userPoints >= 6000) return 'Champion';
    if (_userPoints >= 4000) return 'Planet Guardian';
    if (_userPoints >= 2500) return 'Green Warrior';
    return 'Eco Rookie';
  }

  void _addSetoran(String jenis, double berat) {
    try {
      final double rate = _ratePerKg[jenis] ?? 0;
      final int earned = (berat * rate).round();
      final entry = HistoryEntry(
        title: 'Setoran $jenis',
        detail: '${berat.toStringAsFixed(2)} kg • $earned poin',
        dateLabel: 'Baru saja',
        pointsDelta: earned,
        isGain: true,
      );
      setState(() {
        _userPoints += earned;
        _monthlyKg += berat;
        _history = [entry, ..._history];
      });

      // Add notification
      _addNotification(
        title: 'Setoran Diterima ✓',
        subtitle: '${berat.toStringAsFixed(1)} kg $jenis • +$earned poin',
        type: NotificationType.deposit,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil menambahkan $earned poin!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi kesalahan saat menambahkan setoran'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _openSetorPage() async {
    final result = await Navigator.of(context).push<SetoranInput>(
      MaterialPageRoute(
        builder: (context) => SetorSampahPage(
          ratePerKg: _ratePerKg,
          totalKg: _monthlyKg,
          targetKg: _targetKg,
        ),
      ),
    );
    if (!mounted) return;
    if (result != null) {
      _addSetoran(result.jenis, result.berat);
    }
  }

  Future<void> _openRewardPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RewardPage(
          rewards: _rewardCatalog,
          onRedeem: _redeemReward,
          userPoints: _userPoints,
        ),
      ),
    );
  }

  Future<void> _redeemReward(RewardItem reward) async {
    if (_userPoints < reward.cost) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Poin tidak mencukupi.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final confirmed =
        await Navigator.of(context).push<bool>(
          MaterialPageRoute(
            builder: (context) =>
                RewardRedeemPage(reward: reward, currentPoints: _userPoints),
          ),
        ) ??
        false;

    if (!mounted) return;
    if (!confirmed) return;

    final String code =
        'KOPI${(DateTime.now().millisecondsSinceEpoch % 1000).toString().padLeft(2, '0')}-'
        '${_generateRandomCode(4)}-${_generateRandomCode(4)}';
    final entry = HistoryEntry(
      title: 'Tukar ${reward.title}',
      detail: reward.description,
      dateLabel: 'Baru saja',
      pointsDelta: -reward.cost,
      isGain: false,
    );

    setState(() {
      _userPoints -= reward.cost;
      _history = [entry, ..._history];
    });

    // Add notification
    _addNotification(
      title: 'Penukaran Berhasil 🎁',
      subtitle: reward.title,
      type: NotificationType.redemption,
    );

    if (!mounted) return;
    // Navigate to success page
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            RewardSuccessPage(reward: reward, voucherCode: code),
      ),
    );
  }

  String _generateRandomCode(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(
      length,
      (index) => chars[(random + index) % chars.length],
    ).join();
  }

  void _addNotification({
    required String title,
    required String subtitle,
    required NotificationType type,
  }) {
    setState(() {
      _notifications.insert(
        0,
        NotificationItem(
          id: 'notif-${DateTime.now().millisecondsSinceEpoch}',
          title: title,
          subtitle: subtitle,
          date: DateTime.now(),
          type: type,
        ),
      );
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  void _onProfileUpdated(UserProfile updatedProfile) {
    setState(() {
      _userProfile = updatedProfile;
    });
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        HomePage(
          key: const PageStorageKey('home_page'),
          userName: _userProfile.name,
          userPoints: _userPoints,
          monthlyKg: _monthlyKg,
          targetKg: _targetKg,
          levelLabel: _levelLabel,
          history: _history,
          edukasiItems: _edukasiItems,
          notifications: _notifications,
          onSetorTap: _openSetorPage,
          onRewardTap: _openRewardPage,
          onDeleteNotification: _deleteNotification,
        ),
        EducationPage(
          key: const PageStorageKey('education_page'),
          items: _edukasiItems,
        ),
        HistoryPage(
          key: const PageStorageKey('history_page'),
          history: _history,
        ),
        // Placeholder karena Reward Page dibuka sebagai route terpisah
        Container(
          key: const PageStorageKey('reward_placeholder'),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0B6623), Color(0xFF1B5E20)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        ProfilePage(
          key: const PageStorageKey('profile_page'),
          user: _userProfile,
          userPoints: _userPoints,
          monthlyKg: _monthlyKg,
          levelLabel: _levelLabel,
          totalTransactions: _history.where((e) => e.isGain).length,
          onProfileUpdated: _onProfileUpdated,
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navLabels.length, (index) {
          final selected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                _openRewardPage();
              } else {
                setState(() => _selectedIndex = index);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _navIcons[index],
                  color: selected ? RePointApp.primaryGreen : Colors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  _navLabels[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: selected ? RePointApp.primaryGreen : Colors.grey,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B6623), Color(0xFF1B5E20)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(bottom: false, child: _buildBody()),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }
}
