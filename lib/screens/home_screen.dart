import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (ctx, index) {
                final student = provider.students[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: Checkbox(
                    value: student.isPresent,
                    onChanged: (value) {
                      provider.toggleAttendance(index);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: provider.students.isEmpty
                ? null
                : () {
                    provider.saveAttendance();
                  },
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }
}