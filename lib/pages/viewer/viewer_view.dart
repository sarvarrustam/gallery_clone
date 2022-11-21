import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewerView extends StatelessWidget {
  final Medium medium;

  const ViewerView(Medium medium) : medium = medium;

  @override
  Widget build(BuildContext context) {
    DateTime? date = medium.modifiedDate;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: date != null ? Text(date.toString()) : null,
        ),
        body: Container(
            alignment: Alignment.center,
            child: FadeInImage(
              height: medium.height!.toDouble(),
              width: medium.width!.toDouble(),
              placeholder: MemoryImage(kTransparentImage),
              image: PhotoProvider(mediumId: medium.id),
            )),
      ),
    );
  }
}
