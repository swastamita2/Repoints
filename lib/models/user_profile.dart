class UserProfile {
  final String id;
  String name;
  String email;
  String phone;
  String university;
  String faculty;
  String major;
  String nim;
  String profileImage;
  DateTime joinDate;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.faculty,
    required this.major,
    required this.nim,
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

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? university,
    String? faculty,
    String? major,
    String? nim,
    String? profileImage,
    DateTime? joinDate,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      major: major ?? this.major,
      nim: nim ?? this.nim,
      profileImage: profileImage ?? this.profileImage,
      joinDate: joinDate ?? this.joinDate,
    );
  }
}
