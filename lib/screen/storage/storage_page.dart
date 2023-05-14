import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  File? file;
  ImagePicker image = ImagePicker();
  var imagefile =
      FirebaseStorage.instance.ref().child("contact_photo").child("/qalay.jpg");
  var url;

  _listAll() async {
    final listResult = await imagefile.listAll();
    for (var prefix in listResult.prefixes) {
      print('prefix: $prefix');
    }
// -----
  
   Stream<ListResult> _listAllPaginated(Reference storageRef) async* {
      String? pageToken;
      do {
        final listResult = await storageRef.list(ListOptions(
          maxResults: 100,
          pageToken: pageToken,
        ));
        yield listResult;
        pageToken = listResult.nextPageToken;
      } while (pageToken != null);
    }
  }


  @override
  void initState() {
    _listAll();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: IconButton(
              icon: const Icon(
                Icons.add_a_photo,
                size: 90,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                getImage();
              },
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (file != null) {
                uploadFile();
              }
            },
            child: const Text(
              "Add",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
              ),
            ),
          ),
          url != null ? Image.network(url) : const CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () {
                delete();
              },
              child: Text('delete')),
        
          const Spacer(),
        ],
      ),
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    UploadTask task = imagefile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    setState(() {
      url = url;
    });
    // -----------------------------------------------------

    final newMetadata = SettableMetadata(
      cacheControl: "public,max-age=300",
      contentType: "image/jpeg",
    );

    await imagefile.updateMetadata(newMetadata);

    final metadata = await imagefile.getMetadata();
    print('bucket: ${metadata.bucket}');
    print('cacheControl: ${metadata.cacheControl}');
    print('name: ${metadata.name}');
    print('fullPath: ${metadata.fullPath}');
    print('updated: ${metadata.updated}');
    print('size: ${metadata.size}');
    print('generation: ${metadata.contentType}');

    // -----------------------------------------------------

    setState(() {});
  }

  delete() async {
    await imagefile.delete();
  }
}
