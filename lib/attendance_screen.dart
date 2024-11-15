import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AttendanceScreen extends StatelessWidget {
  final String divisi;

  const AttendanceScreen({super.key, required this.divisi});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reportController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi dan Laporan - $divisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Absen Kehadiran Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Absen Kehadiran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Masukkan nama Anda',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Lottie.asset(
                              'assets/success.json',
                              repeat: false,
                              width: 150,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Anda, ${nameController.text}, telah absen untuk hari ini!')),
                        );
                        nameController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Nama tidak boleh kosong')),
                        );
                      }
                    },
                    child: const Text('Absen Sekarang'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Laporan Pekerjaan Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orangeAccent, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Laporan Pekerjaan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: reportController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Masukkan laporan pekerjaan Anda...',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      String report = reportController.text;
                      if (report.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: Lottie.asset(
                              'assets/submit.json',
                              repeat: false,
                              width: 150,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Laporan berhasil dikirim')),
                        );
                        reportController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Laporan tidak boleh kosong')),
                        );
                      }
                    },
                    child: const Text('Kirim Laporan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
