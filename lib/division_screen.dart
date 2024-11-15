import 'package:flutter/material.dart';
import 'attendance_screen.dart';

class DivisionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> divisions = [
    {'name': 'Akuntan', 'color': Colors.blue},
    {'name': 'Marketing', 'color': Colors.green},
    {'name': 'Produksi', 'color': Colors.orange},
    {'name': 'Human Resources', 'color': Colors.purple},
    {'name': 'Finance', 'color': Colors.teal},
    {'name': 'Information Technology', 'color': Colors.red},
  ];

  DivisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text('Pilih Divisi'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: divisions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceScreen(divisi: divisions[index]['name']),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            divisions[index]['color'].withOpacity(0.7),
                            divisions[index]['color'],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: divisions[index]['color'].withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.business,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            divisions[index]['name'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
