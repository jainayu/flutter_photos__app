import 'package:PhotoCollections/services/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tab_collection_screen.dart';

class PhotoDisplayScreen extends StatefulWidget {
  @override
  _PhotoDisplayScreenState createState() => _PhotoDisplayScreenState();
}

class _PhotoDisplayScreenState extends State<PhotoDisplayScreen> {
  int tabBarValue = 0;
  int tabBarValueGetter() => tabBarValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300],
                  ),
                  constraints: BoxConstraints.expand(height: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFFFFFFF),
                      ),
                      indicatorPadding: EdgeInsets.all(8),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text(
                              "Minimal",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              "Cats",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      TabCollectionScreen(
                        photosModel: PhotosModel(1580860),
                      ),
                      TabCollectionScreen(
                        photosModel: PhotosModel(139386),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
