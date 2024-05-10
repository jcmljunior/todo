import 'dart:io';
import 'package:dio/dio.dart';
import 'package:todo/features/profiles/models/profile.model.dart';
import 'package:todo/shared/services/common.service.dart';

class ProfileService extends CommonService {
  ProfileService(super.client);

  Future<List<ProfileModel>> getProfiles() async {
    final Response<dynamic> response =
        await client.get("${uri.toString()}users",
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
