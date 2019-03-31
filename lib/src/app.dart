import "package:flutter/material.dart";
import "package:http/http.dart";
import "model/image_model.dart";
import "dart:convert";
import "widgets/image_list.dart";

class App extends StatefulWidget {
  createState(){
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter ++;
    final response = await get('http://jsonplaceholder.typicode.com/photos');
    final imageModel = ImageModel.fromJson(json.decode(response.body)[counter]);

    setState(() {
      images.add(imageModel);
    });
}

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text('AlgorithmLABS')
        ),
        body: ImageList(images),
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: fetchImage
        ),
      ),
    );
  }
}
