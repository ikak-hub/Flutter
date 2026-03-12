import 'dart:io';

void main() {
//   // Membuat set dengan data awal
//   Set<String> Burung = {'Merpati', 'Elang', 'Kakatua'};
//   print('Burung: $Burung');
//   }



  // Membuat set dengan data awal
  Set<String> Data = {'a', 'b', 'c', 'd', 'e'};
  print('Total Data: $Data');

  // masukkan data baru ke dalam set
  stdout.write('Masukkan data baru: ');
  String? input = stdin.readLineSync();
  if (input != null && input.isNotEmpty) {
    Data.add(input);
    print('Setelah menambahkan data baru: $Data');
  } else {
    print('Input tidak valid. Data tidak ditambahkan.');
  }

  // menambah data duplikat ke dalam set
  stdout.write('Masukkan data duplikat untuk mencoba: ');
  String? duplicateInput = stdin.readLineSync();
  if (duplicateInput != null && duplicateInput.isNotEmpty) {
    Data.add(duplicateInput);
    print('Setelah mencoba menambahkan data duplikat: $Data');
  } else {
    print('Input tidak valid. Data duplikat tidak ditambahkan.');
  }

  // Menghapus data dari set
  stdout.write('Masukkan data yang ingin dihapus: ');
  String? deleteInput = stdin.readLineSync();
  if (deleteInput != null && deleteInput.isNotEmpty) {
    if (Data.remove(deleteInput)) {
      print('Data: $Data berhasil dihapus.');
    } else {
      print('Data tidak ditemukan dalam set. Tidak ada yang dihapus.');
    }
  } else {
    print('Input tidak valid. Data tidak dihapus.');
  }

  // masukkan data yang ingin dicari dalam set
  stdout.write('Masukkan data yang ingin dicari: ');
  String? searchInput = stdin.readLineSync();
  if (searchInput != null && searchInput.isNotEmpty) {
    if (Data.contains(searchInput)) {
      print('Data: $searchInput ditemukan dalam set.');
    } else {
      print('Data: $searchInput Tidak ada di set.');
    }
  } else {
    print('Input tidak valid. Pencarian tidak dilakukan.');
  }

  // // menghitung jumlah data dalam set
  // print('Jumlah data dalam set: ${Data.length}');
}


