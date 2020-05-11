import 'package:PhotoCollections/services/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/unsplash.dart';

class TabCollectionScreen extends StatelessWidget {
  TabCollectionScreen({@required this.photosModel});
  final PhotosModel photosModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Unsplash>(
        future: photosModel.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.photos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data.photos[index].urls.thumb),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints.expand(height: 8.0),
                        ),
                        Text(
                          snapshot.data.photos[index].user.name,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
