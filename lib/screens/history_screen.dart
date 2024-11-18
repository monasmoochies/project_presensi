import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (ctx, index) {
          final record = provider.history[index];
          return ListTile(
            title: Text('Tanggal: ${record['date'].toString().substring(0, 10)}'),
            subtitle: Text('Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}'),
          );
        },
      ),
    );
  }
}