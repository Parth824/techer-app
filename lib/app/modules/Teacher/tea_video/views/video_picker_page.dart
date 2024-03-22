// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tech_lancer_teacher/app/utils/hidevideos_floatingbutton.dart';
import 'package:tech_lancer_teacher/app/utils/image_in_grid.dart';

class VideoPickerPage extends StatefulWidget {
  String? id;
  String? tital;
  String? decs;
  String? image;
  bool? update;
  VideoPickerPage({super.key, this.id, this.tital, this.decs, this.image,this.update});

  @override
  State<VideoPickerPage> createState() => _VideoPickerPageState();
}

class _VideoPickerPageState extends State<VideoPickerPage> {
  List<Widget> mediaList = [];
  List<AssetEntity> selectedAssets = [];

  // int currentPage = 0;
  int currentIndex = 0;
  int lastIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  

  void _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentIndex < lastIndex) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    var result = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.video,
    );

    AssetPathEntity? k = await albums[0].fetchPathProperties();

    List<AssetEntity> media = await albums[0].getAssetListRange(
      start: currentIndex,
      end: currentIndex + 30,
    );
    lastIndex = await albums[0].assetCountAsync;

    List<Widget> temp = [];
    for (var asset in media) {
      temp.add(
        FutureBuilder(
          future: asset.thumbnailDataWithSize(const ThumbnailSize.square(256)),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                // bool selected = selectedAssets.contains(asset);
                return ImageInGrid(
                  onSelect: (selected) => setState(() {
                    selected
                        ? selectedAssets.add(asset)
                        : selectedAssets.remove(asset);
                  }),
                  bytes: snapshot.data!,
                );
              }
            }
            return Container();
          },
        ),
      );
    }
    setState(() {
      mediaList.addAll(temp);
      currentIndex += 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose Videos",
          style: TextStyle(fontFamily: "Gilroy"),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          _handleScrollEvent(scroll);
          return true;
        },
        child: GridView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: mediaList.length,
          itemBuilder: (BuildContext context, int index) {
            return mediaList[index];
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 128,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
        ),
      ),
     floatingActionButton: (widget.update == true) ?  HideVideosButton(
              selectedAssets: selectedAssets,
              onHideComplete: () => Navigator.pop(context),
              update: true,
              image: widget.image,
              des: widget.decs,
              tital: widget.tital,
              id:widget.id
            ) : selectedAssets.isNotEmpty
          ? HideVideosButton(
              selectedAssets: selectedAssets,
              onHideComplete: () => Navigator.pop(context),
              update: false ,
            )
          : null,
    );
  }
}
