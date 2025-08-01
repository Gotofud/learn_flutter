import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/mandiri/e_output.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, String> design;

  const DetailScreen({
    super.key,
    required this.design,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController uangController = TextEditingController();

  late int hargaPaket;
  int totalHarga = 0;
  int sisa = 0;

  @override
  void initState() {
    super.initState();
    hargaPaket = int.tryParse((widget.design['price'] ?? '0')
            .replaceAll(RegExp(r'[^0-9]'), '')) ??
        0;
  }

  void hitungTotal() {
    int jumlah = int.tryParse(jumlahController.text) ?? 0;
    int uang = int.tryParse(uangController.text) ?? 0;

    setState(() {
      totalHarga = jumlah * hargaPaket;
      sisa = uang - totalHarga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.design['title'] ?? 'Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(widget.design['image'] ?? '', height: 200),
            const SizedBox(height: 20),
            Text(widget.design['desc'] ?? '',
                style: const TextStyle(fontSize: 16)),
            const Divider(height: 40),
            const Text(
              "Formulir Pemesanan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Jumlah Paket",
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => hitungTotal(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: uangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Uang Dibayar",
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => hitungTotal(),
            ),
            const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => eoutput(
                          nama: namaController.text,
                          alamat: alamatController.text,
                          jumlah: jumlahController.text,
                          uang: uangController.text,
                          total: totalHarga,
                          sisa: sisa,
                          harga: hargaPaket,
                        ),
                      ),
                    );
                  },
                  child: Text("Submit"),
                )
          ],
        ),
      ),
    );
  }
}
