import 'dart:io';

import 'package:path_provider/path_provider.dart';

class BaseIO {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> FileValue(String fileName) async {
    final path = await localPath;
    File file = File('$path/$fileName');
    return await file.readAsString();
  }
}
