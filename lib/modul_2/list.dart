import 'dart:io';

void main() {
//   List<String> names = ['Alfa', 'Beta', 'Charlie'];
//   print('Names: $names');

//   // menambahkan data dalam list
//   names.add('Delta');
//   print('Setelah Delta ditambahkan: $names');

//   // mengambil data index tertentu
//   print('Elemen pertama: ${names[0]}');
//   print('Elemen kedua: ${names[1]}');

//   // Mengubah data pada index tertentu
//     names[1] = 'Bravo';
//     print('Setelah Beta diubah menjadi bravo : $names');

//   // menghapus data dari list
//   names.remove('Charlie');
//   print('Setelah Charlie dihapus: $names');

//   // menghitung jumlah data dalam list
//   print('Jumlah nama dalam list: ${names.length}');}

//   // loping melalui list
//   print('Daftar nama:');
//   for (String name in names) {
//     print(name);
//   }
// }


//   // Membuat list kosong
//   List<String> dataList = [];
//   print('Data list kosong: $dataList');

//   // Mengambil jumlah data dari pengguna
//   int count = 0;
//   while (count <= 0) {
//     stdout.write('Masukkan jumlah data yang ingin dimasukkan: ');
//     String? input = stdin.readLineSync();
//     try {
//       count = int.parse(input!);
//       if (count <= 0) {
//         print('Jumlah harus lebih dari 0. Silakan coba lagi.');
//       }
//     } catch (e) {
//       print('Input tidak valid. Silakan masukkan angka.');
//     }
//   }
//   // Memasukkan data ke dalam list menggunakan for loop
//   for (int i = 0; i < count; i++) {
//     stdout.write('Masukkan data ke-${i + 1}: ');
//     String x = stdin.readLineSync()!;
//     dataList.add(x);
//   }

//   // Menampilkan data yang telah dimasukkan
//   print('Data List:');
//   print(dataList);
// }


  List<String> data = [];

  print("=== INPUT DATA LIST ===");
  stdout.write("Masukkan jumlah data: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  // Input data
  for (int i = 0; i < jumlah; i++) {
    stdout.write("Masukkan data ke-${i + 1}: ");
    String? input = stdin.readLineSync();
    data.add(input!);
  }

  print("\nData Awal: $data");

  // TAMPIL BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin ditampilkan: ");
  int indexTampil = int.parse(stdin.readLineSync()!);

  if (indexTampil >= 0 && indexTampil < data.length) {
    print("Data pada index $indexTampil: ${data[indexTampil]}");
  } else {
    print("Index tidak valid!");
  }

  // UBAH BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin diubah: ");
  int indexUbah = int.parse(stdin.readLineSync()!);

  if (indexUbah >= 0 && indexUbah < data.length) {
    stdout.write("Masukkan data baru: ");
    String? dataBaru = stdin.readLineSync();
    data[indexUbah] = dataBaru!;
    print("Data setelah diubah: $data");
  } else {
    print("Index tidak valid!");
  }

  // HAPUS BERDASARKAN INDEX
  stdout.write("\nMasukkan index yang ingin dihapus: ");
  int indexHapus = int.parse(stdin.readLineSync()!);

  if (indexHapus >= 0 && indexHapus < data.length) {
    data.removeAt(indexHapus);
    print("Data setelah dihapus: $data");
  } else {
    print("Index tidak valid!");
  }

  // MENAMPILKAN HASIL AKHIR
  print("\n=== SEMUA DATA ===");
  for (int i = 0; i < data.length; i++) {
      print("Index $i: ${data[i]}");
  }
}
