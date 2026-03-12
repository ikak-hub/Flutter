import 'package:flutter/material.dart';
import 'package:d4tivokasi/modul_3/class_object.dart';

class DashboardProvider extends ChangeNotifier{
  int _mahasiswa = 120;
  int _dosen = 30;
  int _matakuliah = 45;

  int get mahasiswa => _mahasiswa;
  int get dosen => _dosen;
  int get matakuliah => _matakuliah;

  void tambahMahasiswa(){
    _mahasiswa++;
    notifyListeners();
  }

  void tambahDosen() {
    _dosen++;
    notifyListeners();
  }

  void tambahMataKuliah() {
    _matakuliah++;
    notifyListeners();
  }
}