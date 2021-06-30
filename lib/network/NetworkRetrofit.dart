import 'dart:convert';

import 'package:dart_wallet/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:japx/japx.dart';
import 'package:logger/logger.dart';

import 'model/AssetsModel.dart';

final logger = Logger();

void main() async {
  final client = APIClient(Dio());
  final json = await client.getAssets();

  final resultJson = Japx.decode(jsonDecode(json));
  // print(resultJson);
  final assetsModel = AssetsModel.fromMap(resultJson['data'][0]);
  print(assetsModel.id);
}
