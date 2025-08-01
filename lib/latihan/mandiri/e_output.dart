import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class eoutput extends StatelessWidget {
  final String nama, alamat, jumlah, uang;
  final int total, sisa, harga;

  eoutput({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.jumlah,
    required this.uang,
    required this.total,
    required this.sisa,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Output Form",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
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
                  _textWidget("Nama", nama),
                  _textWidget("Alamat", alamat),
                  _textWidget("Jumlah Paket", jumlah),
                  _textWidget("Harga Perpaket", "Rp $harga"),
                  _textWidget("Uang", "Rp $uang"),
                  _textWidget("Total Harga", "Rp $total"),
                  _textWidget("Sisa/Kembalian",
                      sisa >= 0 ? "Rp $sisa" : "Kurang Rp ${sisa.abs()}"),
                ],
              ),
            ),
          ),
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
            width: 120,
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
