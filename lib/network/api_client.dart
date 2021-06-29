import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class APIClient{
  factory APIClient(Dio dio) = _APIClient;

  @GET("/assets")
  Future<String> getAssets();
}