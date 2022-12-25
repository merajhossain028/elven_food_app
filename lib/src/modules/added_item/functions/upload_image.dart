import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String?> uploadImageMobile(File? file) async {
  //
  if (file == null) return null;

  try {
    final ref = FirebaseStorage.instance.ref().child(
          'images/${DateTime.now().millisecond}.jpg',
        );
    UploadTask? uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});

    final downloadUrl = await snapshot.ref.getDownloadURL();

    print('Photo uploaded. Url: $downloadUrl');

    return downloadUrl;
  } catch (e) {
    print('error in uploading image for : ${e.toString()}');
    return null;
  }
}