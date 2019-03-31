import "package:flutter/material.dart";
import "../model/image_model.dart";


class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    // return ListView.builder(
    //   itemCount: images.length,
    //   itemBuilder: (context, int index) {
        // return Image.network(images[index].url);
      return Container(
        decoration: BoxDecoration(
          border:Border.all(color: Colors.grey)
        ),

        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        // child: Image.network(images[index].url),
        child: Column(
          children: <Widget>[
            Image.network(image.url),
            Text(image.title),
          ]
        )
      );
    }
}
