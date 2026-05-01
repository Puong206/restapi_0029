class HewanModel {
  final int id;
  final String nama;
  final String jenis;
  final String deskripsi;
  final int harga;
  final String status;

  HewanModel({
    required this.id,
    required this.nama,
    required this.jenis,
    required this.deskripsi,
    required this.harga,
    required this.status,
  });

  factory HewanModel.fromJson(Map<String, dynamic> json) {
    return HewanModel(
      id: json['id'],
      nama: json['nama'],
      jenis: json['jenis'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      status: json['status'],
    );
  }
}