import 'dart:io';
void main() {
//   // Membuat Map dengan data awal
//   Map<String, String> data = {
//     'Anang': '081234567890',
//     'Arman': '082345678901',
//     'Doni': '083456789012',
//   };
//   print('Contact: $data');

//   // menambahkan data ke map
//   data['Rio'] = '084567890123';
//   print('Data setelah ditambahkan: $data');

//   // Menagakses data berdasarkan key
//   print('Nomor Anang: ${data['Anang']}');

//   // UBAH DATA BERDASARKAN KEY
//   stdout.write("\nMasukkan key yang ingin diubah: ");
//   String? keyUbah = stdin.readLineSync();

//   if (data.containsKey(keyUbah)) {
//     stdout.write("Masukkan nilai baru: ");
//     var nilaiBaru = stdin.readLineSync();
//     data[keyUbah!] = nilaiBaru!;
//     print("Data setelah diubah: $data");
//   } else {
//     print("Key tidak ditemukan!");
//   }

//   // HAPUS DATA BERDASARKAN KEY
//   stdout.write("\nMasukkan key yang ingin dihapus: ");
//   String? keyHapus = stdin.readLineSync();

//   if (data.containsKey(keyHapus)) {
//     data.remove(keyHapus);
//     print("Data setelah dihapus: $data");
//   } else {
//     print("Key tidak ditemukan!");
//   }

//   // CEK DATA BERDASARKAN KEY
//   stdout.write("\nMasukkan key yang ingin dicek: ");
//   String? keyCek = stdin.readLineSync();

//   if (data.containsKey(keyCek)) {
//     print("Data ditemukan: ${data[keyCek]}");
//   } else {
//     print("Key tidak ditemukan!");
//   }

//   // HITUNG JUMLAH DATA
//   print("\nJumlah data dalam map: ${data.length}");

//   // TAMPILKAN SEMUA KEY
//   print("\nSemua Key:");
//   data.keys.forEach((key) {
//     print(key);
//   });

//   // TAMPILKAN SEMUA VALUE
//   print("\nSemua Value:");
//   data.values.forEach((value) {
//     print(value);
//   });
// }



  // Membuat Map kosong
  Map<String, dynamic> mahasiswa = {};

  // Tambah Data (Single Input)
  print("\n=== INPUT DATA MAHASISWA ===");
  stdout.write("Masukkan NIM: ");
  mahasiswa['nim'] = stdin.readLineSync();

  stdout.write("Masukkan Nama: ");
  mahasiswa['nama'] = stdin.readLineSync();

  stdout.write("Masukkan Jurusan: ");
  mahasiswa['jurusan'] = stdin.readLineSync();

  stdout.write("Masukkan IPK: ");
  mahasiswa['ipk'] = double.parse(stdin.readLineSync()!);

  print("\nData Mahasiswa: $mahasiswa");


  // MULTIPLE INPUT (List of Map)
  print("\n=== INPUT MULTIPLE MAHASISWA ===");
  stdout.write("Masukkan jumlah mahasiswa: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> listMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print("\n--- Mahasiswa ke-${i + 1} ---");

    Map<String, dynamic> data = {};

    stdout.write("Masukkan NIM: ");
    data['nim'] = stdin.readLineSync();

    stdout.write("Masukkan Nama: ");
    data['nama'] = stdin.readLineSync();

    stdout.write("Masukkan Jurusan: ");
    data['jurusan'] = stdin.readLineSync();

    stdout.write("Masukkan IPK: ");
    data['ipk'] = double.parse(stdin.readLineSync()!);

    listMahasiswa.add(data);
  }

  print("\n=== DATA SEMUA MAHASISWA ===");
  for (var mhs in listMahasiswa) {
    print(mhs);
  }
}