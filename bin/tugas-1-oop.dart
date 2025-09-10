import 'dart:io';

class Laundry {
  String paket;
  int hargaPerKg;

  Laundry(this.paket, this.hargaPerKg);

  int hitungHarga(int berat) {
    int totalHarga = hargaPerKg * berat;
    double totalSetelahDiskon = totalHarga.toDouble();

    if (totalHarga >= 100000) {
      totalSetelahDiskon = 0.9 * totalHarga;
      print("Anda mendapatkan diskon 10%");
    } else if (totalHarga > 50000) {
      totalSetelahDiskon = 0.95 * totalHarga;
      print("Anda mendapatkan diskon 5%");
    }

    return totalSetelahDiskon.toInt();
  }
}

void main() {
  //buat object Laundry
  var paketCuciSetrika = Laundry('Cuci + Setrika', 6000);
  var paketCuci = Laundry('Cuci', 4000);
  var paketSetrika = Laundry('Setrika', 3000);

  print("Selamat datang di Aplikasi Laundry Sederhana");
  print("Silahkan Masukkan nama anda: ");
  String? nama = stdin.readLineSync();

  print("Halo $nama, Silahkan pilih paket yang anda mau:");
  print("1. ${paketCuciSetrika.paket} (Rp ${paketCuciSetrika.hargaPerKg}/kg)");
  print("2. ${paketCuci.paket} (Rp ${paketCuci.hargaPerKg}/kg)");
  print("3. ${paketSetrika.paket} (Rp ${paketSetrika.hargaPerKg}/kg)");

  //Input Pilihan Paket
  stdout.write("Pilihan paket $nama adalah (1/2/3): ");
  String? pilihan = stdin.readLineSync();

  //Input Berat Cucian
  stdout.write("Silahkan masukkan berat cucian (dalam kg): ");
  int berat = int.parse(stdin.readLineSync()!);

  // Tentukan paket yang dipilih
  Laundry? paketDipilih;
  if (pilihan == "1") {
    paketDipilih = paketCuciSetrika;
  } else if (pilihan == "2") {
    paketDipilih = paketCuci;
  } else if (pilihan == "3") {
    paketDipilih = paketSetrika;
  } else {
    print("Pilihan tidak valid!");
    return;
  }

  // Hitung total harga
  int totalHarga = paketDipilih.hitungHarga(berat);

  // Output hasil
  print("\n=== Struk Laundry ===");
  print("Nama    : $nama");
  print("Paket   : ${paketDipilih.paket}");
  print("Berat   : $berat kg");
  print("Harga sebelum diskon: Rp ${paketDipilih.hargaPerKg * berat}");
  print("Total setelah diskon: Rp $totalHarga");
}
