import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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

    debugPrint('Photo uploaded. Url: $downloadUrl');

    return downloadUrl;
  } catch (e) {
    debugPrint('error in uploading image for : ${e.toString()}');
    return null;
  }
}