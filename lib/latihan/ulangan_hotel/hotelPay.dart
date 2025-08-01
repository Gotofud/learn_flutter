import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class HotelPay extends StatefulWidget {
  final String nama, tglPenginapan, hari;
  final Map<String, String>? detail;

  HotelPay({
    Key? key,
    required this.nama,
    required this.tglPenginapan,
    required this.hari,
    this.detail,
  }) : super(key: key);

  @override
  State<HotelPay> createState() => _HotelPayState();
}

class _HotelPayState extends State<HotelPay> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hariController = TextEditingController();
  final TextEditingController tglPenginapanController = TextEditingController();
  final TextEditingController uangController = TextEditingController();

  late int hargaPaket;
  int totalHarga = 0;
  int sisa = 0;

  @override
  void initState() {
    super.initState();
    // Set nilai awal dari parameter yang diterima
    namaController.text = widget.nama;
    tglPenginapanController.text = widget.tglPenginapan;
    hariController.text = widget.hari;
    
    // Set harga paket jika detail tersedia
    hargaPaket = widget.detail != null 
        ? int.tryParse((widget.detail!['hargaPermalam'] ?? '0')
            .replaceAll(RegExp(r'[^0-9]'), '')) ?? 0
        : 0;
    
    // Hitung total awal
    hitungTotal();
  }

  void hitungTotal() {
    int hari = int.tryParse(hariController.text) ?? 0;
    int uang = int.tryParse(uangController.text) ?? 0;

    setState(() {
      totalHarga = hari * hargaPaket;
      sisa = uang - totalHarga;
    });
  }

  String formatRupiah(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), 
        (Match m) => '${m[1]},');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pembayaran')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan gambar hanya jika detail tersedia
            if (widget.detail != null && widget.detail!['img'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.detail!['img']!,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            
            // Card Ringkasan Pembayaran
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringkasan Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    _textWidget("Nama Pemesan", namaController.text),
                    _textWidget("Tanggal Penginapan", tglPenginapanController.text),
                    _textWidget("Jumlah Hari Penginapan", hariController.text),
                    _textWidget("Harga Per Malam", "Rp ${formatRupiah(hargaPaket)}"),
                    _textWidget("Total Harga", "Rp ${formatRupiah(totalHarga)}"),
                    _textWidget("Uang Pembayaran", 
                        "Rp ${uangController.text.isEmpty ? '0' : formatRupiah(int.tryParse(uangController.text) ?? 0)}"),
                    _textWidget("Sisa/Kembalian", 
                        sisa >= 0 
                            ? "Rp ${formatRupiah(sisa)}" 
                            : "Kurang Rp ${formatRupiah(sisa.abs())}"),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Form Input Uang Pembayaran
            TextField(
              controller: uangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Uang Pembayaran",
                border: OutlineInputBorder(),
                prefixText: "Rp ",
              ),
              onChanged: (value) => hitungTotal(),
            ),
            const SizedBox(height: 30),
            
            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sisa >= 0 && uangController.text.isNotEmpty ? () {
                  // Aksi konfirmasi pembayaran
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pembayaran Berhasil!'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama: ${namaController.text}'),
                            Text('Total: Rp ${formatRupiah(totalHarga)}'),
                            Text('Kembalian: Rp ${formatRupiah(sisa)}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: sisa >= 0 && uangController.text.isNotEmpty 
                      ? Colors.orangeAccent 
                      : Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), 
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), 
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  sisa < 0 && uangController.text.isNotEmpty
                      ? "Uang Kurang Rp ${formatRupiah(sisa.abs())}"
                      : "Konfirmasi Pembayaran"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              "$label",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}