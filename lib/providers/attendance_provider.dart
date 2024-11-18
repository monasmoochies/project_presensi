import 'package:flutter/material.dart';
import '../models/attendance_model.dart';

class AttendanceProvider with ChangeNotifier {
  // Daftar siswa awal
  List<Attendance> students = [
    Attendance(name: 'Ali'),
    Attendance(name: 'Budi'),
    Attendance(name: 'Citra'),
  ];

  
  List<Map<String, dynamic>> history = [];

  
  void toggleAttendance(int index) {
    students[index].isPresent = !students[index].isPresent;
    notifyListeners();
  }

  
  void saveAttendance() {
    int presentCount = students.where((s) => s.isPresent).length;
    int absentCount = students.length - presentCount;

    history.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    
    for (var student in students) {
      student.isPresent = false;
    }
    notifyListeners();
  }
}