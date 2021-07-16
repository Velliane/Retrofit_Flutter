import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_with_flutter/nasa_model.dart';

part 'api_manager.g.dart';


@RestApi(baseUrl:"https://api.nasa.gov")
abstract class ApiManager{

  factory ApiManager(Dio dio, {String baseUrl}){
    dio = Dio();
    return _ApiManager(dio, baseUrl: baseUrl);
  }

  @GET('/planetary/apod?')
  Future <Nasa> getImage(@Query("api_key") String  apiKey);

}

