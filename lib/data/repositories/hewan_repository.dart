import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi_0029/data/models/hewan_model.dart';
import 'package:restapi_0029/data/providers/storage_provider.dart';

class HewanRepository {
  final String _baseUrl = "https://ternak-be-production.up.railway.app/api/v1";
  final StorageProvider storage = StorageProvider();

  Future<List<HewanModel>> getAllHewan() async {
    final token = await storage.getToken();

    final response = await http.get(
      Uri.parse("$_baseUrl/hewan"),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> data = body['data'];
      return data.map((item) => HewanModel.fromJson(item)).toList();
    } else {
      throw Exception("Gagal mengambil data hewan: ${response.statusCode}");
    }
  }

  Future<void> createHewan(Map<String, dynamic> hewanData) async {
    final token = await storage.getToken();

    final response = await http.post(
      Uri.parse("$_baseUrl/hewan"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(hewanData),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      final data = jsonDecode(response.body);
      throw data['message'] ?? "Gagal menambahkan hewan: ${response.statusCode}";
    }
  }

  Future<void> updateHewan(int id, Map<String, dynamic> hewanData) async {
    final token = await storage.getToken();

    final response = await http.put(
      Uri.parse("$_baseUrl/hewan/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(hewanData),
    );

    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      throw data['message'] ?? "Gagal memperbarui data hewan: ${response.statusCode}";
    }
  }

  Future<void> deleteHewan(int id) async {
    final token = await storage.getToken();

    final response = await http.delete(
      Uri.parse("$_baseUrl/hewan/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      final data = jsonDecode(response.body);
      throw data['message'] ?? "Gagal menghapus data hewan: ${response.statusCode}";
    }
  }
}