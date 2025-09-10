import 'dart:io';

void main() {
  //Dekralasi Awal Harga yang Ditawarkan
  const int paketCuciSetrika = 6000;
  const int paketCuci = 4000;
  const int paketSetrika = 3000;

  print("Selamat datang di Aplikasi Laundry Sederhana");
  print("Silahkan Masukkan nama anda: ");
  String? nama = stdin.readLineSync();
  print("Halo $nama, Silahkan pilih paket yang anda mau:");
  print("1. Paket Cuci + Setrika (Rp $paketCuciSetrika/kg)");
  print("2. Paket Cuci (Rp $paketCuci/kg)");
  print("3. Paket Setrika (Rp $paketSetrika/kg)");

  //Input Pilihan Paket
  stdout.write("Pilihan paket $nama adalah (1/2/3): ");
  int pilihan = int.parse(stdin.readLineSync()!);

  //Input Berat Cucian
  stdout.write("Berapa berat cucian $nama ? (kg): ");
  int berat = int.parse(stdin.readLineSync()!);

  //Proses perhitungan
  int hargaPerKg = 0;
  if (pilihan == 1) {
    hargaPerKg = paketCuciSetrika;
  } else if (pilihan == 2) {
    hargaPerKg = paketCuci;
  } else if (pilihan == 3) {
    hargaPerKg = paketSetrika;
  } else {
    print("Pilihan paket tidak valid");
    return;
  }

  //hitung total harga
  int totalHarga = hargaPerKg * berat;

  //Cek Harga Diskon
  double diskon = 0;
  if (totalHarga > 100000) {
    diskon = 0.1 * totalHarga;
    print(
      "Selamat $nama, Anda mendapatkan diskon 10% sebesar Rp ${diskon.toInt()}",
    );
  } else if (totalHarga > 50000) {
    diskon = 0.05 * totalHarga;
    print(
      "Selamat $nama, Anda mendapatkan diskon 5% sebesar Rp ${diskon.toInt()}",
    );
  }

  double hargaSetelahDiskon = totalHarga - diskon;

  //Struk Pembayaran
  print("====Struk Pembayaran Laundry====");
  print("Nama Pelanggan: $nama");
  print(
    "Paket yang dipilih: ${pilihan == 1
        ? "Cuci + Setrika"
        : pilihan == 2
        ? "Cuci"
        : "Setrika"}",
  );
  print("Berat Cucian: $berat kg");
  print("Total Harga: Rp ${totalHarga.toInt()}");
  print("Diskon: Rp ${diskon.toInt()}");
  print("Harga Setelah Diskon: Rp ${hargaSetelahDiskon.toInt()}");
}
