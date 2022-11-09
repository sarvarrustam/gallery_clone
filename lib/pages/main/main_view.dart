import 'dart:developer';
import 'dart:io';

import 'package:file_picker_galery/pages/viewer/viewer_view.dart';
import 'package:file_picker_galery/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Size? size;
  List<Album>? _albums;
  MediaPage? _medium;
  List<Medium>? _listMedium;
  bool _loading = false;

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      log(_promptPermissionSetting().toString());
      List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);
      _medium = await albums.first.listMedia();
      setState(() {
        _albums = albums;
        _loading = false;
        _listMedium = _medium!.items;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      //? drawer

      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //image
                SizedBox(
                  width: double.infinity,
                  height: 180.h,
                  child: Image.asset(
                    "assets/images/splash.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //? app bar

      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: .0,
        title: Text(
          'Photos Gallery',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: EdgeInsets.zero,
              color: Theme.of(context).bottomAppBarColor,
              icon: Icon(
                CupertinoIcons.bars,
                size: 28.w,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Theme.of(context).bottomAppBarColor,
              )),
        ],
      ),

      //? body

      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: [
                ..._listMedium!.map(
                  (item) => GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewerView(item))),
                    child: Container(
                      color: Colors.grey[300],
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: ThumbnailProvider(
                          mediumId: item.id,
                          mediumType: item.mediumType,
                          highQuality: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

      //? floting action button them changer

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppUtils.themeChanger();
        },
      ),
    );
  }
}
