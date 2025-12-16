class UserProfile {
  final String id;
  String name;
  String email;
  String phone;
  String university;
  String userRole; // Mahasiswa, Dosen, Tendik/Staff
  String identityNumber; // NIM untuk mahasiswa, NIP untuk dosen/staff
  String
  department; // Jurusan (mahasiswa), Fakultas (dosen), Unit Kerja (staff)
  String profileImage;
  DateTime joinDate;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.userRole,
    required this.identityNumber,
    required this.department,
    this.profileImage = '',
    required this.joinDate,
  });

  String get initials {
    final names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : 'U';
  }

  // Getter untuk label identitas (NIM/NIP)
  String get identityLabel {
    return userRole == 'Mahasiswa' ? 'NIM' : 'NIP';
  }

  // Getter untuk label department
  String get departmentLabel {
    if (userRole == 'Mahasiswa') return 'Jurusan';
    if (userRole == 'Dosen') return 'Fakultas';
    return 'Unit Kerja';
  }

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? university,
    String? userRole,
    String? identityNumber,
    String? department,
    String? profileImage,
    DateTime? joinDate,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      university: university ?? this.university,
      userRole: userRole ?? this.userRole,
      identityNumber: identityNumber ?? this.identityNumber,
      department: department ?? this.department,
      profileImage: profileImage ?? this.profileImage,
      joinDate: joinDate ?? this.joinDate,
    );
  }
}
