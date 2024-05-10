import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/features/profiles/models/profile.model.dart';

class ProfileService {
  final Dio _client;
  final url = "http://192.168.169.28:3000/users";

  ProfileService(this._client);

  Future<List<ProfileModel>> getProfiles() async {
    final Response<dynamic> response = await _client.get(url,
        options: Options(
          contentType: ContentType.json.toString(),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ));
    await Future.delayed(const Duration(seconds: 1));
    final List<ProfileModel> profiles = List.from(response.data)
        .map((e) => ProfileModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return profiles;
  }
}
