import 'package:dio/dio.dart';

abstract class CommonService {
  final Dio client;
  final Uri uri = Uri(
    scheme: "http",
    host: "192.168.169.28",
    port: 3000,
    path: "/",
  );

  CommonService(this.client);
}
