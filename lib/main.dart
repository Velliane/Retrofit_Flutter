import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_with_flutter/api_manager.dart';
import 'package:retrofit_with_flutter/nasa_model.dart';

const String apiKey = "iGYWMc18daeHcGIU4TfHzI7Tui8bRu48NrnPf8Vl";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showNasaImage(apiKey) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget showNasaImage(String query){
  final client = ApiManager(Dio());
  return FutureBuilder<Nasa>(
      future: client.getImage(query),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          final Nasa nasaModel = snapshot.data;
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage (
                  image: NetworkImage(nasaModel.url),
                  fit: BoxFit.cover
                )
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      });

}
