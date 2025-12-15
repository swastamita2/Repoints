import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';

class SetoranInput {
  final String jenis;
  final double berat;

  const SetoranInput({required this.jenis, required this.berat});
}

class SetorSampahPage extends StatefulWidget {
  final Map<String, double> ratePerKg;
  final double totalKg;
  final double targetKg;

  const SetorSampahPage({
    super.key,
    required this.ratePerKg,
    required this.totalKg,
    required this.targetKg,
  });

  @override
  State<SetorSampahPage> createState() => _SetorSampahPageState();
}

class _SetorSampahPageState extends State<SetorSampahPage> {
  late String _selectedType;
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedType = widget.ratePerKg.keys.first;
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _submit() {
    final weightText = _weightController.text.trim().replaceAll(',', '.');
    if (weightText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukkan berat sampah terlebih dahulu.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    final weight = double.tryParse(weightText);
    if (weight == null || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukkan berat yang valid (lebih dari 0 kg).'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (weight > 1000) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berat maksimal 1000 kg per setoran.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    Navigator.of(
      context,
    ).pop(SetoranInput(jenis: _selectedType, berat: weight));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F8E9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Setor Sampah',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'asset/sampah.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      'Total Setoran Bulan Ini',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.totalKg.toStringAsFixed(1)} kg',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 14,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Jenis & Berat Sampah',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: RePointApp.primaryGreen,
                          fontWeight: FontWeight.w800,
                          shadows: const [
                            Shadow(
                              color: Color(0x33000000),
                              offset: Offset(0, 1),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedType,
                        decoration: _inputDecoration(
                          'Jenis Sampah',
                          hint: 'Pilih Jenis Sampah',
                        ),
                        items: widget.ratePerKg.entries
                            .map(
                              (entry) => DropdownMenuItem(
                                value: entry.key,
                                child: Text(
                                  '${entry.key} • ${entry.value.toInt()} poin/kg',
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedType = value);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _weightController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: _inputDecoration(
                          'Berat Sampah',
                          hint: 'Masukkan berat dalam kg (max 1000)',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Berat tidak boleh kosong';
                          }
                          final weight = double.tryParse(
                            value.replaceAll(',', '.'),
                          );
                          if (weight == null || weight <= 0) {
                            return 'Masukkan berat yang valid';
                          }
                          if (weight > 1000) {
                            return 'Berat maksimal 1000 kg';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              'Foto Verifikasi (Optional)',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16),
                            Icon(
                              Icons.photo_camera,
                              size: 46,
                              color: RePointApp.primaryGreen,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Ambil Foto Sampah',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Foto untuk membantu verifikasi petugas',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: RePointApp.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Kirim Setoran',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, {required String hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF9FDF5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: RePointApp.primaryGreen,
          width: 1.6,
        ),
      ),
    );
  }
}
