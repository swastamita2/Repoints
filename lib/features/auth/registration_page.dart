import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';
import '../../app/repoint_shell.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _identityController = TextEditingController();
  final _departmentController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _selectedRole;
  String? _selectedDepartment;

  final List<String> _roles = ['Mahasiswa', 'Dosen', 'Tendik/Staff'];

  final Map<String, List<String>> _departments = {
    'Mahasiswa': [
      'Teknik Informatika',
      'Teknik Elektro',
      'Teknik Sipil',
      'Teknik Mesin',
      'Teknik Lingkungan',
      'Teknik Industri',
      'Sistem Informasi',
      'Arsitektur',
    ],
    'Dosen': [
      'Fakultas Teknik',
      'Fakultas Ekonomi dan Bisnis',
      'Fakultas Ilmu Sosial dan Politik',
    ],
    'Tendik/Staff': [
      'Akademik',
      'Keuangan',
      'IT & Sistem Informasi',
      'Umum & Fasilitas',
      'Kemahasiswaan',
      'Perpustakaan',
    ],
  };

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _identityController.dispose();
    _departmentController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Get user data from form
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _phoneController.text.trim();
      final role = _selectedRole ?? 'Mahasiswa';
      final identityNumber = _identityController.text.trim();
      final department = _selectedDepartment ?? _departments[role]!.first;

      // Navigate directly to main app with user data
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RePointShell(
            userName: name,
            userEmail: email,
            userPhone: phone,
            userRole: role,
            identityNumber: identityNumber,
            department: department,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  // Logo
                  Image.asset('asset/logo_utama.png', height: 266),
                  const SizedBox(height: 80),
                  // Main Content Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Title
                          const Text(
                            'Daftar Akun',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: RePointApp.primaryGreen,
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Nama Pengguna
                          _buildTextField(
                            controller: _nameController,
                            label: 'Nama Pengguna',
                            hint: 'Destia Rani',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Email
                          _buildTextField(
                            controller: _emailController,
                            label: 'Email',
                            hint: 'nama@itpln.ac.id',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              if (!value.contains('@')) {
                                return 'Email tidak valid';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Role/Tipe User (Dropdown)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
                                ),
                                child: DropdownButtonFormField<String>(
                                  initialValue: _selectedRole,
                                  decoration: const InputDecoration(
                                    labelText: 'Tipe Pengguna',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  hint: const Text('Pilih Tipe Pengguna'),
                                  items: _roles.map((String role) {
                                    return DropdownMenuItem<String>(
                                      value: role,
                                      child: Text(role),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedRole = newValue;
                                      _selectedDepartment =
                                          null; // Reset department
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih tipe pengguna';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // NIM/NIP (Conditional)
                          _buildTextField(
                            controller: _identityController,
                            label: _selectedRole == 'Mahasiswa' ? 'NIM' : 'NIP',
                            hint: _selectedRole == 'Mahasiswa'
                                ? '2106123456'
                                : '198901012020121001',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '${_selectedRole == 'Mahasiswa' ? 'NIM' : 'NIP'} tidak boleh kosong';
                              }
                              if (_selectedRole == 'Mahasiswa' &&
                                  value.length < 8) {
                                return 'NIM minimal 8 digit';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Department (Conditional based on role)
                          if (_selectedRole != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedDepartment,
                                    decoration: InputDecoration(
                                      labelText: _selectedRole == 'Mahasiswa'
                                          ? 'Jurusan'
                                          : _selectedRole == 'Dosen'
                                          ? 'Fakultas'
                                          : 'Unit Kerja',
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 16,
                                          ),
                                    ),
                                    hint: Text(
                                      'Pilih ${_selectedRole == 'Mahasiswa'
                                          ? 'Jurusan'
                                          : _selectedRole == 'Dosen'
                                          ? 'Fakultas'
                                          : 'Unit Kerja'}',
                                    ),
                                    items: _departments[_selectedRole]!.map((
                                      String dept,
                                    ) {
                                      return DropdownMenuItem<String>(
                                        value: dept,
                                        child: Text(dept),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedDepartment = newValue;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Pilih ${_selectedRole == 'Mahasiswa'
                                            ? 'jurusan'
                                            : _selectedRole == 'Dosen'
                                            ? 'fakultas'
                                            : 'unit kerja'}';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          // Kata Sandi
                          _buildPasswordField(
                            controller: _passwordController,
                            label: 'Kata Sandi',
                            obscure: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kata sandi tidak boleh kosong';
                              }
                              if (value.length < 8) {
                                return 'Kata sandi minimal 8 karakter';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              '* Minimal 8 Karakter',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Konfirmasi Kata Sandi
                          _buildPasswordField(
                            controller: _confirmPasswordController,
                            label: 'Konfirmasi Kata Sandi',
                            obscure: _obscureConfirmPassword,
                            onToggle: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Konfirmasi kata sandi tidak boleh kosong';
                              }
                              if (value != _passwordController.text) {
                                return 'Kata sandi tidak cocok';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          // No. Telp
                          _buildTextField(
                            controller: _phoneController,
                            label: 'No. Telp',
                            hint: '081234567890',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor telepon tidak boleh kosong';
                              }
                              if (value.length < 10) {
                                return 'Nomor telepon tidak valid';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          // Register Button
                          ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA5B68D),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Daftar Akun RePoints',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Login Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Sudah punya akun?  ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: RePointApp.primaryGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            validator: validator,
          ),
        ),
        if (hint != null) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              '* Contoh : $hint',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback onToggle,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey.shade600,
            ),
            onPressed: onToggle,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
