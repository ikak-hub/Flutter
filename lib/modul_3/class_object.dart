import 'dart:io';
// CLASS
// class Mahasiswa {
//   String nama = "Anang";

//   void tampilkanData() {
//     print(nama);
//   }
// }

// void main(){
//   var mahasiswa1 = Mahasiswa();
//   mahasiswa1.tampilkanData();

//   stdout.write('Masukkan nama baru: ');
//   String? namaBaru = stdin.readLineSync();
//   if (namaBaru != null && namaBaru.isNotEmpty) {
//     mahasiswa1.nama = namaBaru;
//     print("Nama berhasil diubah.");
//     mahasiswa1.tampilkanData();
//   } else {
//     print('Nama tidak boleh kosong.');
//   }
// }

// OBJECT
class Mahasiswa{
  String? nama;
  int? nim;
  // String? jurusan;

  void tampilkanData(){
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    // print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}
// void main(){
//   Mahasiswa mahasiswa = Mahasiswa();
//   print("Masukkan Nama Mahasiswa:");
//   mahasiswa.nama = stdin.readLineSync();
//   print("Masukkan NIM Mahasiswa:");
//   mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');
//   print("Masukkan Jurusan Mahasiswa:");
//   mahasiswa.jurusan = stdin.readLineSync();
//   mahasiswa.tampilkanData();
// }

// EXTENDS
// class MahasiswaAktif extends Mahasiswa {
//   int? semester;

//   void tampilkanStatus() {
//     print("Status  : Mahasiswa Aktif");
//     print("Semester: ${semester ?? 'Belum diisi'}");
//   }
// }

// class MahasiswaAlumni extends Mahasiswa {
//   int? tahunLulus;

//   void tampilkanStatus() {
//     print("Status     : Alumni");
//     print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
//   }
// }

// void main() {
//   stdout.write("Pilih status mahasiswa (1 = Aktif, 2 = Alumni): ");
//   String? pilihan = stdin.readLineSync();

//   if (pilihan == '1') {
//     MahasiswaAktif mhs = MahasiswaAktif();

//     stdout.write("Nama: ");
//     mhs.nama = stdin.readLineSync();

//     stdout.write("NIM: ");
//     mhs.nim = int.tryParse(stdin.readLineSync() ?? '');

//     stdout.write("Jurusan: ");
//     mhs.jurusan = stdin.readLineSync();

//     stdout.write("Semester: ");
//     mhs.semester = int.tryParse(stdin.readLineSync() ?? '');

//     print("\n=== MAHASISWA AKTIF ===");
//     mhs.tampilkanData();
//     mhs.tampilkanStatus();

//   } else if (pilihan == '2') {
//     MahasiswaAlumni mhs = MahasiswaAlumni();

//     stdout.write("Nama: ");
//     mhs.nama = stdin.readLineSync();

//     stdout.write("NIM: ");
//     mhs.nim = int.tryParse(stdin.readLineSync() ?? '');

//     stdout.write("Jurusan: ");
//     mhs.jurusan = stdin.readLineSync();

//     stdout.write("Tahun Lulus: ");
//     mhs.tahunLulus = int.tryParse(stdin.readLineSync() ?? '');

//     print("\n=== MAHASISWA ALUMNI ===");
//     mhs.tampilkanData();
//     mhs.tampilkanStatus();
//   } else {
//     print("Pilihan tidak valid.");
//   }
// }

// MIXIN (MINIMAL 3)
mixin Mengajar {
  void mengajar() {
    print("Aktivitas: Mengajar");
  }
}

mixin Meneliti {
  void meneliti() {
    print("Aktivitas: Meneliti");
  }
}

mixin Administrasi {
  void administrasi() {
    print("Aktivitas: Administrasi fakultas");
  }
}
class Dosen extends Mahasiswa with Mengajar, Meneliti {
  String? mataKuliah;

  void tampilkanDosen() {
    print("Peran       : Dosen");
    print("Mata Kuliah : ${mataKuliah ?? '-'}");
  }
}

// Fakultas turunan dari Mahasiswa
class Fakultas extends Mahasiswa with Administrasi {
  String? namaFakultas;

  void tampilkanFakultas() {
    print("Peran        : Fakultas");
    print("Nama Fakultas: ${namaFakultas ?? '-'}");
  }
}

void main() {
  // OBJECT DOSEN
  Dosen dosen = Dosen();
  dosen.nama = "Anang";
  dosen.nim = 1111;
  dosen.mataKuliah = "Pemrograman Mobile";

  print("=== DATA DOSEN ===");
  dosen.tampilkanData();   
  dosen.tampilkanDosen();  
  dosen.mengajar();        
  dosen.meneliti();        

  print("\n");

  // OBJECT FAKULTAS
  Fakultas fakultas = Fakultas();
  fakultas.nama = "Admin Fakultas";
  fakultas.nim = 2222;
  fakultas.namaFakultas = "Teknik Informatika";

  print("=== DATA FAKULTAS ===");
  fakultas.tampilkanData();     
  fakultas.tampilkanFakultas(); 
  fakultas.administrasi();      
}